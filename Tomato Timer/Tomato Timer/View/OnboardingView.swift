//
//  OnboardingView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 09.03.2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?
    
    var body: some View {
        ZStack {
            Color(uiColor: Helper.Colors.onboardingBackground)
                .ignoresSafeArea()
            VStack {
                if isFirstLaunch ?? false {
                    MainView()
                } else {
                    GeometryReader { geo in
                        ZStack {
                            MainView()
                            Color.black.opacity(0.6)
                                .ignoresSafeArea()
                            Text("How to use")
                                .foregroundStyle(.white)
                                .font(.custom("Copperplate-light", size: 34))
                                .position(x: geo.size.width / 2, y: geo.size.height / 10)
                            Text("Start / Stop")
                                .foregroundStyle(.white)
                                .font(.custom("Copperplate-light", size: 24))
                                .position(x: geo.size.width / 2, y: geo.size.height - 130)
                            Image("tap")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .position(x: geo.size.width / 2, y: geo.size.height - 60)
                            Text("Mood")
                                .foregroundStyle(.white)
                                .font(.custom("Copperplate-light", size: 24))
                                .position(x: geo.size.width - 80, y: geo.size.height / 2.1)
                            Image("tap")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .position(x: geo.size.width - 80, y: geo.size.height / 2.8)
                        }
                        .onTapGesture {
                            withAnimation {
                                isFirstLaunch = true
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
