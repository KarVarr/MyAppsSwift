//
//  ClockView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

enum TimeAMPM {
    case pm, am
}

enum Mood: String {
    case code, `break`
}

struct ClockView: View {
    @ObservedObject var soundViewModel = SoundViewModel()
    @ObservedObject var clockViewModel = ClockViewModel()
    
    @Binding var timerCount: CGFloat
    @Binding var sessionCount: Int
    @Binding var currentMood: Mood
    @Binding var countdownTime: CGFloat
    @Binding var defaultTime: CGFloat
    
    @State var isLoading: Bool = true
    @State var currentTimePeriod: TimeAMPM = .am
    @State var currentDate: String = ""
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var currentHour: Int = 0
    
    let screenHeight = UIScreen.main.bounds.height
    
    var fontSize: CGFloat {
        switch UIScreen.main.bounds.height {
        case 0..<600:
            return 13
        case 600..<800:
            return 15
        case 800..<1000:
            return 17
        default:
            return 19
        }
    }
    
    //body in extension ClockViewBody + Ext
}

#Preview {
    ClockView(timerCount: .constant(1200), sessionCount: .constant(0), currentMood: .constant(.code), countdownTime: .constant(1200), defaultTime: .constant(1200))
}


