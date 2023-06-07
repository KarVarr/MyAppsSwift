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
    
    @State private var buttonImageColor = 0.5
    @State private var shadowRadius = 15
    
    @State private var showingAlertNotVibration = false
    
    var body: some View {
            VStack {
                
                GeometryReader { geo in
                    ZStack {
                        
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            
                            Spacer()
                            HStack(alignment: .center) {
                                Button {
                                    showingAlertNotVibration = true
                                } label: {
                                    Image(systemName: "questionmark.circle")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                                .alert(isPresented: $showingAlertNotVibration) {
                                    Alert(title: Text("Not Vibrating?"), message: Text(Helpers.String.alertMessage), dismissButton: .default(Text("Got it!")))
                                }
                                .padding(.horizontal)
                                Spacer()
                                Text("Pulse Ride")
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "gear")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                                .padding(.horizontal)
                                
                            }
                            
                            Spacer(minLength: 100)
                            
                            StackTextVertical(title: Helpers.String.pressButtonTextTitle, subtitle: Helpers.String.pressButtonTextSubtitle)
                            
//                            StartScreenView(engine: $engine, startButtonAction: nomNomPattern, prepare: prepareHaptics, stop: stopHaptics)
                            
                            
                            HStack {
                                Image("snail")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                                SliderView(percentage: $value)
                                    .frame(width: geo.size.width - 110, height: 44)
                                Image("rabbit")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .opacity(0.8)
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
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                    }
                    
                }
            }
        
        
        
    }
    
    
    func startStopButton()  {
        if !isPlaying {
            withAnimation {
                buttonImageColor = 1
                shadowRadius = 5
            }
            isPlaying = true
        } else {
            withAnimation {
                buttonImageColor = 0.5
                shadowRadius = 15
            }
            isPlaying = false
            
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
