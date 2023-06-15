//
//  ContentView.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 25.05.2023.
//

import SwiftUI
import CoreHaptics



struct ContentView: View {
    @StateObject private var massageVM = MassageViewModel.shared
    
    @State private var engineRunning = false
    @State private var engine: CHHapticEngine?
    @State private var patternPlayer: CHHapticPatternPlayer?
    
    @State private var isPlaying = false
    
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
                                .onTapGesture {
                                    startButton()
                                    massageVM.toggleVibration()
                                }
                                
                            }
                            
                        }
                        
                        //MARK: - BUTTONS
                        
                        HStack(spacing: 30) {
                            ForEach(imagesForButtons, id: \.self) { image in
                                CustomButtonForIntensity(action: {
                                    massageVM.impactFeedback(.soft)
                                    switch image {
                                    case "snail":
                                        massageVM.valueOfIntensity = 0.6
                                    case "tornado":
                                        massageVM.valueOfIntensity = 0.8
                                    case "rocket":
                                        massageVM.valueOfIntensity = 1.0
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
                    massageVM.setupHapticEngine()
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
            buttonIsPressed = true
            isPlaying = true
        } else {
            withAnimation {
                buttonImageColor = 0.5
                shadowRadius = 15
            }
            buttonIsPressed = false
            isPlaying = false
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
