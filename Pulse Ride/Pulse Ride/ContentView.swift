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
    @State private var valueForIntensity: Float = 0.5
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
                                    case "snail": valueForIntensity = 0.4
                                    case "tornado": valueForIntensity = 0.7
                                    case "rocket": valueForIntensity = 1.0
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
//            stopHapticVibrationLoop()
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
    
   //MARK: - HAPTIC VIBRATION
    
    func generalHapticVibration() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        let mediumVibration = createHapticEvent(intensity: valueForIntensity, sharpness: 0.5, relativeTime: 0, duration: 1.25)
        var events = [mediumVibration]
        
        let hardVibrationParameters = [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
            CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.1)
        ]
        
        for relativeTime in stride(from: 1.25, to: 2.15, by: 0.2) {
            let hardVibration = createHapticEvent(eventTime: .hapticContinuous, parameters: hardVibrationParameters, relativeTime: relativeTime, duration: 0.15)
            events.append(hardVibration)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            patternPlayer = player
            
            try player?.stop(atTime: 0)
            
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
        
        
    }

    func createHapticEvent(eventTime: CHHapticEvent.EventType, parameters: [CHHapticEventParameter], relativeTime: Double, duration: Double) -> CHHapticEvent {
        return CHHapticEvent(eventType: .hapticContinuous, parameters: parameters, relativeTime: relativeTime, duration: duration)
    }

    func createHapticEvent(intensity: Float, sharpness: Float, relativeTime: Double, duration: Double) -> CHHapticEvent {
        let parameters = [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
            CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        ]
        return createHapticEvent(eventTime: .hapticContinuous, parameters: parameters, relativeTime: relativeTime, duration: duration)
    }

   
    
    func totalDuration(events: [CHHapticEvent]) -> TimeInterval {
        var totalDuration: TimeInterval = 0
        
        for event in events {
            totalDuration += event.duration
        }
        
        return totalDuration
    }

    func startHapticVibrationLoop(events: [CHHapticEvent]) {
        if hapticIsPlaying {
            return
        }
        
        hapticIsPlaying = true
        
      
            var currentTime: TimeInterval = 0
            
            while self.hapticIsPlaying {
                for event in events {
                    do {
                        try self.patternPlayer?.start(atTime: currentTime + event.relativeTime)
                    } catch {
                        print("Failed to start haptic vibration: \(error.localizedDescription).")
                    }
                }
                
                currentTime += self.totalDuration(events: events)
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
