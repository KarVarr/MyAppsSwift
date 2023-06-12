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
    @State private var valueForIntensity: Float = 0.3
    @State private var sharpness = 0.5
    @State private var durationWithButtons = 1
    
    @State private var buttonIsPressed = false
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    @State private var scale = 1.5
    
    let heightArrayForAnimation = [30,40,50,60,70,80]
    @State private var rectangleHeight =  [40, 30, 50, 60, 80, 50, 40, 70, 50, 30, 60 ,80 ,40]
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    let imagesForButtons = ["snail", "tornado", "rocket"]
    
    @State private var hapticIsPlaying = false
    
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
                        
                        Spacer(minLength: 50)
                        
                        //MARK: - TEXT AND ANIMATION
                        VStack {
                            if isPlaying {
                                HStack {
                                    ForEach(0..<rectangleHeight.count, id: \.self) { index in
                                        CustomRectangleForAnimation(width: 15, height: CGFloat(rectangleHeight[index]), color: .white.opacity(0.8))
                                    }
                                }
                            } else {
                                StackTextVertical(title: Helpers.String.pressButtonTextTitle, subtitle: Helpers.String.pressButtonTextSubtitle)
                            }
                        }
                        .frame(height: 80)
                        
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
                                    startButton()
                                }
                                
                            }
                            
                        }
                        
                        //MARK: - BUTTONS
                        
                        HStack(spacing: 30) {
                            ForEach(imagesForButtons, id: \.self) { image in
                                CustomButtonForIntensity(action: {
                                    impactFeedback()
                                    switch image {
                                    case "snail": valueForIntensity = 0.3
                                    case "tornado": valueForIntensity = 0.6
                                    case "rocket": valueForIntensity = 0.9
                                    default:
                                        break
                                    }
                                }, imageName: image)
                                
                                
                            }
                        }
                        Spacer(minLength: 30)
                        
                        
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
            generalHapticVibration()
        } else {
            withAnimation {
                buttonImageColor = 0.5
                shadowRadius = 15
            }
            isPlaying = false
            buttonIsPressed = false
            stopHapticVibrationLoop()
        }
    }
    
    func impactFeedback() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .soft)
        impactGenerator.impactOccurred()
    }
    
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
    
//    func stopHaptics() {
//        if let engine = engine, engineRunning {
//            engine.stop(completionHandler: { error in
//                if let error = error {
//                    print("Error stopping haptic engine: \(error.localizedDescription)")
//                } else {
//                    self.engine = nil
//                    engineRunning = false
//                }
//            })
//        }
//    }
    
    
    func generalHapticVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
//        let vibration = CHHapticEvent(
//            eventType: .hapticContinuous,
//            parameters: [
//                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.4)),
//                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.9))
//            ],
//            relativeTime: 0,
//        duration: 3)
//        events.append(vibration)
//
//        let vibrationSoft = CHHapticEvent(
//            eventType: .hapticContinuous,
//            parameters: [
//                CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5)),
//                CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
//            ],
//            relativeTime: 3,
//            duration: 2)
//        events.append(vibrationSoft)
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
//
            patternPlayer = player
            startHapticVibrationLoop()
//
//            try player?.start(atTime: 0)
            
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func startHapticVibrationLoop() {
        if hapticIsPlaying {
            return
        }
        
        hapticIsPlaying = true
        
        DispatchQueue.global().async {
            while self.hapticIsPlaying {
                do {
                    try self.patternPlayer?.start(atTime: 0)
                } catch {
                    print("Failed to start haptic vibration: \(error.localizedDescription).")
                }
            }
        }
    }
    
    func stopHapticVibrationLoop() {
        hapticIsPlaying = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(1)) {
            do {
                try self.patternPlayer?.stop(atTime: 0)
            } catch {
                print("Failed to stop haptic vibration: \(error.localizedDescription).")
            }
        }
    }
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
