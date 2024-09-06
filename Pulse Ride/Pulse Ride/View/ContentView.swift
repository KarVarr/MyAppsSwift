//
//  ContentView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 25.05.2023.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var massageVM = MassageViewModel.shared
    var imagesNameForButtons = ImagesNameForButtons()
    
    @State var engine: CHHapticEngine?
    @State var continuousPlayer: CHHapticAdvancedPatternPlayer?
    
    @State var isPlaying = false
    @State var isButtonPressed = false
    @State var buttonImageColor = 0.5
    @State var shadowRadius = 15
    @State var scale = 1.5
    
    let heightArrayForAnimation = [30,40,50,60,70,80]
    @State private var rectangleHeight = [40, 30, 50, 60, 80, 50, 40, 70, 50, 30, 60 ,80 ,40]
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        CustomNavBar()
                        Spacer(minLength: 50)
                        
                        VStack {
                            if isPlaying {
                                HStack {
                                    ForEach(0..<rectangleHeight.count, id: \.self) { index in
                                        CustomRectangleForAnimation(width: 15, height: CGFloat(rectangleHeight[index]), color: .white.opacity(0.8))
                                            .transition(.opacity)
                                    }
                                }
                                .animation(.easeInOut, value: rectangleHeight)
                            } else {
                                VStackTitleAndSubtitle(title: Helpers.String.pressButtonTextTitle, subtitle: Helpers.String.pressButtonTextSubtitle)
                                    .transition(.opacity)
                            }
                        }
                        .frame(height: 80)
                        .animation(.easeInOut, value: isPlaying)
                        VStack {
                            GeometryReader { geo in
                                CustomButtonCircle(buttonImageColor: $buttonImageColor, shadowRadius: $shadowRadius, scale: $scale, isPlaying: $isPlaying)
                                    .onTapGesture {
                                        toggleVibration()
                                    }
                            }
                        }
                        
                        HStack(spacing: 30) {
                            ForEach(imagesNameForButtons.nameForImages, id: \.self) { image in
                                CustomButtonForIntensity(action: {
                                    massageVM.impactFeedback(.soft)
                                    updateVibrationIntensityBasedOnImage(image)
                                }, imageName: image)
                            }
                        }
                        Spacer(minLength: 30)
                    }
                }
                .onAppear {
                    setupHaptics()
                }
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .active {
                        if isPlaying {
                            stopVibration()
                            resetButtonState()
                        }
                    } else if newPhase == .background {
                        if isPlaying {
                            stopVibration()
                            resetButtonState()
                        }
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            if isPlaying {
                updateRectangleHeights()
            }
        }
    }
    
    private func resetButtonState() {
        withAnimation {
            isPlaying = false
            isButtonPressed = false
            buttonImageColor = 0.5
            shadowRadius = 15
        }
    }
    
    private func updateRectangleHeights() {
        for index in 0..<rectangleHeight.count {
            DispatchQueue.main.asyncAfter(deadline: .now() - Double(index)) {
                withAnimation {
                    rectangleHeight[index] = heightArrayForAnimation.randomElement() ?? 40
                }
            }
        }
    }
    
    private func updateVibrationIntensityBasedOnImage(_ image: String) {
        switch image {
        case "snail":
            updateVibrationIntensity(0.6)
        case "tornado":
            updateVibrationIntensity(0.8)
        case "rocket":
            updateVibrationIntensity(1.0)
        default:
            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
