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
    case coding, reading, cooking
}

struct ClockView: View {
    @ObservedObject private var soundViewModel = SoundViewModel()
    @ObservedObject var clockViewModel = ClockViewModel()
    
    @Binding var timerCount: CGFloat
    @Binding var sessionCount: Int
    
    @State var isLoading: Bool = true
    @State var currentTimePeriod: TimeAMPM = .am
    @State var currentMood: Mood = .coding
    @State private var currentDate: String = ""
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentHour: Int = 0
    
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
    
    //MARK: - Body
    var body: some View {
        clockViewBody(timerCount: timerCount, sessionCount: sessionCount)
            .onReceive(timer, perform: { _ in
                DispatchQueue.main.async {
                    let calendar = Calendar.current
                    currentHour = calendar.component(.hour, from: Date())
                    currentTimePeriod = currentHour >= 12 ? .pm : .am
                    currentDate = getCurrentDate()
                    isLoading = false
                }
            })
    }
}

#Preview {
    ClockView(timerCount: .constant(1200), sessionCount: .constant(0))
}


