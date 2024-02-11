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
        //        Color(uiColor: Helper.Colors.background)
        //            .ignoresSafeArea()
        //            .overlay {
        //                
        //                VStack(alignment: .leading) {
        //                    //MARK: - enum
        //                    HStack {
        //                        textAndColor(name: "enum", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "Mood", color: Helper.Colors.typeName)
        //                        textAndColor(name: "{", color: Helper.Colors.brackets)
        //                    }
        //                    
        //                    HStack {
        //                        textAndColor(name: "    case", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "coding,", color: Helper.Colors.variableName)
        //                        textAndColor(name: "reading,", color: Helper.Colors.variableName)
        //                        textAndColor(name: "cooking", color: Helper.Colors.variableName)
        //                    }
        //                    
        //                    //MARK: - End of enum
        //                    textAndColor(name: "}", color: Helper.Colors.brackets)
        //                    
        //                    //MARK: - Spacer
        //                    HStack {
        //                        Text("")
        //                    }
        //                    
        //                    //MARK: - class
        //                    HStack {
        //                        textAndColor(name: "class", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "TomatoTimer", color: Helper.Colors.typeName)
        //                        textAndColor(name: "{", color: Helper.Colors.brackets)
        //                        
        //                    }
        //                    //MARK: - Date
        //                    HStack {
        //                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "date", color: Helper.Colors.variableName)
        //                        textAndColor(name: "=", color: Helper.Colors.brackets)
        //                        textAndColor(name: "\"\(getCurrentDate())\"", color: Helper.Colors.string).bold()
        //                    }
        //                    //MARK: - Time
        //                    HStack {
        //                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "time", color: Helper.Colors.variableName)
        //                        + textAndColor(name: ":", color: Helper.Colors.brackets)
        //                        
        //                        textAndColor(name: "AM", color: Helper.Colors.type)
        //                            .opacity(currentTimePeriod == .am ? 1 : 0.3)
        //                        textAndColor(name: "PM", color: Helper.Colors.type)
        //                            .opacity(currentTimePeriod == .pm ? 1 : 0.3)
        //                        
        //                        textAndColor(name: "=", color: Helper.Colors.brackets)
        //                        textAndColor(name: "\(clockViewModel.currentTime)", color: Helper.Colors.number).bold()
        //                    }
        //                    
        //                    HStack {
        //                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "session", color: Helper.Colors.variableName)
        //                        + textAndColor(name: ":", color: Helper.Colors.brackets)
        //                        textAndColor(name: "Count", color: Helper.Colors.type)
        //                        textAndColor(name: "=", color: Helper.Colors.brackets)
        //                        textAndColor(name: "\(sessionCount)", color: Helper.Colors.number)
        //                    }
        //                    
        //                    //MARK: - Spacer
        //                    HStack {
        //                        Text("")
        //                    }
        //                    //MARK: - Comments
        //                    HStack {
        //                        textAndColor(name: "    //time for concentration", color: Helper.Colors.comments)
        //                    }
        //                    //MARK: - Init()
        //                    HStack {
        //                        
        //                        Text("\(textAndColor(name: "    init", color: Helper.Colors.variable).bold())\(textAndColor(name: "()", color: Helper.Colors.brackets))")
        //                        textAndColor(name: "{", color: Helper.Colors.brackets)
        //                    }
        //                    
        //                    //MARK: - Action
        //                    HStack {
        //                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "action", color: Helper.Colors.variableName)
        //                        + textAndColor(name: ":", color: Helper.Colors.brackets)
        //                        textAndColor(name: "Mood", color: Helper.Colors.type)
        //                        textAndColor(name: "=", color: Helper.Colors.brackets)
        //                        textAndColor(name: ".\(currentMood.rawValue)", color: Helper.Colors.ifElseCondition)
        //                    }
        //                    .onTapGesture {
        //                        switch currentMood {
        //                        case .coding:
        //                            currentMood = .reading
        //                        case .reading:
        //                            currentMood = .cooking
        //                        case .cooking:
        //                            currentMood = .coding
        //                        }
        //                        generateHapticFeedback(style: .light)
        //                    }
        //                    
        //                    //MARK: - Focus
        //                    HStack {
        //                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
        //                        textAndColor(name: "focus", color: Helper.Colors.variableName)
        //                        textAndColor(name: "=", color: Helper.Colors.brackets)
        //                        
        //                        textAndColor(name: "\"", color: Helper.Colors.string)
        //                        + textAndColor(name: "\\", color: Helper.Colors.white)
        //                        + textAndColor(name: "(", color: Helper.Colors.white)
        //                        + textAndColor(name: String(format: "%.0f",timerCount / 60), color: Helper.Colors.number).bold().font(.title3).monospacedDigit()
        //                        + textAndColor(name: ")", color: Helper.Colors.white)
        //                        + textAndColor(name: " minutes", color: Helper.Colors.string)
        //                        + textAndColor(name: "\"", color: Helper.Colors.string)
        //                        
        //                    }
        //                    
        //                    HStack {
        //                        textAndColor(name: "    }", color: Helper.Colors.brackets)
        //                        
        //                    }
        //                    //MARK: - End of class
        //                    textAndColor(name: "}", color: Helper.Colors.brackets)
        //                    
        //                }
        //                .frame(maxWidth: .infinity)
        //                .padding()
        clockViewBody(timerCount: timerCount, sessionCount: sessionCount)
            .onReceive(timer, perform: { _ in
                let calendar = Calendar.current
                currentHour = calendar.component(.hour, from: Date())
                currentTimePeriod = currentHour >= 12 ? .pm : .am
                currentDate = getCurrentDate()
            })
        
    
}

}

#Preview {
    ClockView(timerCount: .constant(1200), sessionCount: .constant(0))
    
}


