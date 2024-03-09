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
                    Image("onboarding")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
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

#Preview {
    OnboardingView()
}
