//
//  ContentView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 19.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var timerCount: CGFloat = 1200
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
                VStack(alignment: .center) {
                    ClockView(timerCount: $timerCount)
                        .padding(.bottom, 50)
                    Spacer()
                    TimerView(timerCount: $timerCount)
                        .padding(.bottom, 50)
                }
            }
    }
}

#Preview {
    ContentView()
}

//enum Mood {
//    case coding, reading, exercising
//}
//
//class TomatoTimer {
//    var date = "24 January 2024"
////    var time: PM = 8:31:22
//    var activity: Mood = .coding
//    var focusDuration: Int?
//    
//    // Дополнительная информация
//    init() {
//        focusDuration = 20
//    }
//}






