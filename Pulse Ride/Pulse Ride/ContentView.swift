//
//  ContentView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 25.05.2023.
//

import SwiftUI
import CoreHaptics



struct ContentView: View {
    @State private var engineRunning = false
    @State private var engine: CHHapticEngine?
    @State private var patternPlayer: CHHapticPatternPlayer?
    
    @State private var isPlaying = false
    @State private var value: Float = 0.5
    @State private var sharpness = 0.5
    
    @State private var buttonIsPressed = false
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    @State private var scale = 1.5
    
    let heightArrayForAnimation = [30,40,50,60,70,80]
    @State private var rectangleHeight =  [40, 30, 50, 60, 80, 50, 40, 70, 50, 30, 60 ,80 ,40]
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack {
            
            GeometryReader { geo in
                ZStack {
                    
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        //MARK: - NAVBAR
                        CustomNavBar()
                        
                        Spacer(minLength: 100)
                        
                        if isPlaying {
                            HStack {
                                ForEach(0..<rectangleHeight.count, id: \.self) { index in
                                    CustomRectangleForAnimation(width: 15, height: CGFloat(rectangleHeight[index]), color: .white.opacity(0.8))
                                }
                            }
                        } else {
                            StackTextVertical(title: Helpers.String.pressButtonTextTitle, subtitle: Helpers.String.pressButtonTextSubtitle)
                        }
                        
                        //MARK: - BUTTON
                        
                        VStack{
                            GeometryReader { geo in
                                ZStack{
                                    Circle()
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    
                                        .frame(maxWidth: geo.size.width / 1.5, maxHeight: geo.size.width )
                                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                                        .shadow(radius: CGFloat(shadowRadius), x: CGFloat(shadowRadius), y: CGFloat(shadowRadius))
                                    
                                    
                                    Image(systemName: "power")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white.opacity(buttonImageColor))
                                        .frame(width: geo.size.width / 4, height: geo.size.height / 3)
                                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                                        .scaleEffect(scale)
                                        .animation(.easeIn(duration: 1), value: scale)
                                }
                                .onAppear {
                                    prepareHaptics()
                                    
                                }
                                .onTapGesture {
                                    if !buttonIsPressed {
                                        nomNomPattern()
                                    } else {
                                        
                                    }
                                    startButton()
                                }
                                
                            }
                            
                        }
                        
                        //                            StartScreenView(engine: $engine, startButtonAction: nomNomPattern, prepare: prepareHaptics, stop: stopHaptics)
                        
                        
                        //MARK: - SLIDER
                        HStack {
                            CustomImage(imageName: "snail")
                            SliderView(percentage: $value)
                                .frame(width: geo.size.width - 110, height: 44)
                            CustomImage(imageName: "rabbit")
                        }
                        .padding(.vertical)
                        
                        Spacer(minLength: 70)
                        
                        
                    }
                }
                .onAppear {
                    prepareHaptics()
                }
            }
        }
        .onReceive(timer) { _ in
            if isPlaying {
                for index in 0..<rectangleHeight.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() - Double(index)) {
                        withAnimation {
                            rectangleHeight[index] = heightArrayForAnimation.randomElement() ?? 40
                        }
                    }
                }
            }
            

        }
        
    }
    
    
    func startButton() {
        if !buttonIsPressed {
            withAnimation {
                buttonImageColor = 1
                shadowRadius = 5
            }
            isPlaying = true
            buttonIsPressed = true
        } else {
            withAnimation {
                buttonImageColor = 0.5
                shadowRadius = 15
            }
            isPlaying = false
            buttonIsPressed = false
        }
    }
    //    func simpleSuccess() {
    //        let generator = UINotificationFeedbackGenerator()
    //        generator.notificationOccurred(.warning)
    //    }
    //
    //    func selectionFeedback() {
    //        let feedbackGenerator = UISelectionFeedbackGenerator()
    //        feedbackGenerator.selectionChanged()
    //    }
    //
    //    func impactFeedback() {
    //        let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    //        impactGenerator.impactOccurred()
    //    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            if engine == nil {
                engine = try CHHapticEngine()
                
            }
            if let engine = engine, !engineRunning {
                try engine.start()
                engineRunning = true
            }
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func stopHaptics() {
        if let engine = engine, engineRunning {
            engine.stop(completionHandler: { error in
                if let error = error {
                    print("Error stopping haptic engine: \(error.localizedDescription)")
                } else {
                    self.engine = nil
                    engineRunning = false
                }
            })
        }
    }
    
    
    func nomNomPattern() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let rumble1 = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(value)),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(value))
            ],
            relativeTime: 0,
            duration: 2)
        events.append(rumble1)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
            
            patternPlayer = player
            
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    
    
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
