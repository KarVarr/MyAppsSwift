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
    
    @State private var isAnimateLockScreenIcon = true
    @State var isPlaying = false
    @State var isButtonPressed = false
    @State var buttonImageColor = 0.5
    @State var shadowRadius = 15
    @State var scale = 1.5
    
    @State private var isScreenLocked = false
    @State private var showUnlockMessage = false
    @ObservedObject private var volumeObserver = VolumeObserver()
    
    let heightArrayForAnimation = [30,40,50,60,70,80]
    @State private var rectangleHeight = [40, 30, 50, 60, 80, 50, 40, 70, 50, 30, 60 ,80 ,40]
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { geo in
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.33, blue: 0.78), Color(red: 0.73, green: 0.11, blue: 0.45)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            CustomNavBar(isScreenLocked: $isScreenLocked)
                            Spacer(minLength: 50)
                            
                            VStack {
                                if massageVM.isVibrating {
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
                            .animation(.easeInOut, value: massageVM.isVibrating)
                            VStack {
                                GeometryReader { geo in
                                    CustomButtonCircle(buttonImageColor: .constant(massageVM.isVibrating ? 1 : 0.5), shadowRadius: .constant(massageVM.isVibrating ? 5 : 15), scale: .constant(1.5), isPlaying: .constant(massageVM.isVibrating))
                                        .onTapGesture {
                                            if !isScreenLocked {
                                                withAnimation {
                                                    massageVM.toggleVibration()
                                                }
                                            }
                                        }
                                }
                            }
                            .animation(.easeInOut, value: massageVM.isVibrating)
                            
                            HStack(spacing: 30) {
                                ForEach(imagesNameForButtons.nameForImages, id: \.self) { image in
                                    CustomButtonForIntensity(action: {
                                        if !isScreenLocked {
                                            massageVM.impactFeedback(.soft)
                                            updateVibrationIntensityBasedOnImage(image)
                                        }
                                    }, imageName: image)
                                    .disabled(isScreenLocked)
                                    
                                }
                            }
                            Spacer(minLength: 30)
                        }
                    }
                }
                .onReceive(timer) { _ in
                    if massageVM.isVibrating {
                        updateRectangleHeights()
                    }
                }
            }
            
            if isScreenLocked {
                Color.black
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                VStack {
                    Image(systemName: "lock.app.dashed")
                        .resizable()
                        .symbolEffect(.pulse, isActive: isAnimateLockScreenIcon)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Text(Helpers.String.isScreenBlockedTitle)
                        .font(.title3)
                        .foregroundColor(.white)
                    if !showUnlockMessage {
                        Text(Helpers.String.isScreenBlockedSubtitle)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .transition(.opacity)
                    }
                }
                .zIndex(2)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isScreenLocked)
        .onReceive(volumeObserver.$isVolumeButtonPressed) { isPressed in
            if isPressed && isScreenLocked {
                withAnimation {
                    isScreenLocked = false
                    showUnlockMessage = false
                }
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .active:
                setupHaptics()
                volumeObserver.setupVolumeObserver()
                if massageVM.isVibrating {
                    massageVM.startVibration()
                }
            case .background:
                massageVM.stopVibration()
                volumeObserver.invalidateObserver()
            case .inactive:
                massageVM.stopVibration()
            @unknown default:
                break
            }
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
            massageVM.updateVibrationIntensity(0.5)
        case "tornado":
            massageVM.updateVibrationIntensity(0.75)
        case "rocket":
            massageVM.updateVibrationIntensity(0.99)
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
