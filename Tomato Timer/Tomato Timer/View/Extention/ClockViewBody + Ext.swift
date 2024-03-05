//
//  ClockViewBody + Ext.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 11.02.2024.
//

import SwiftUI

extension ClockView {
    func clockViewBody(timerCount: CGFloat, sessionCount: Int) -> some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
                VStack(alignment: .leading) {
                    //MARK: - enum
                    HStack {
                        textAndColor(name: "enum", color: Helper.Colors.variable).bold()
                        textAndColor(name: "Mood", color: Helper.Colors.typeName)
                        textAndColor(name: "{", color: Helper.Colors.brackets)
                    }
                    
                    HStack {
                        textAndColor(name: "    case", color: Helper.Colors.variable).bold()
                        textAndColor(name: "coding,", color: Helper.Colors.variableName)
                        textAndColor(name: "reading,", color: Helper.Colors.variableName)
                        textAndColor(name: "cooking", color: Helper.Colors.variableName)
                    }
                    
                    //MARK: - End of enum
                    textAndColor(name: "}", color: Helper.Colors.brackets)
                    
                    //MARK: - Spacer
                    HStack {
                        Text("")
                    }
                    
                    //MARK: - class
                    HStack {
                        textAndColor(name: "class", color: Helper.Colors.variable).bold()
                        textAndColor(name: "TomatoTimer", color: Helper.Colors.typeName)
                        textAndColor(name: "{", color: Helper.Colors.brackets)
                        
                    }
                    //MARK: - Date
                    HStack {
                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
                        textAndColor(name: "date", color: Helper.Colors.variableName)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\"\(getCurrentDate())\"", color: Helper.Colors.string).bold()
                    }
                    //MARK: - Time
                    HStack {
                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
                        textAndColor(name: "time", color: Helper.Colors.variableName)
                        + textAndColor(name: ":", color: Helper.Colors.brackets)
                        
                        textAndColor(name: "AM", color: Helper.Colors.type)
                            .opacity(currentTimePeriod == .am ? 1 : 0.3)
                        textAndColor(name: "PM", color: Helper.Colors.type)
                            .opacity(currentTimePeriod == .pm ? 1 : 0.3)
                        
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        isLoading ? textAndColor(name: "00:00:00", color: Helper.Colors.number).bold() : textAndColor(name: "\(clockViewModel.currentTime)", color: Helper.Colors.number).bold()
                    }
                    
                    HStack {
                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
                        textAndColor(name: "session", color: Helper.Colors.variableName)
                        + textAndColor(name: ":", color: Helper.Colors.brackets)
                        textAndColor(name: "Count", color: Helper.Colors.type)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(sessionCount)", color: Helper.Colors.number)
                    }
                    
                    //MARK: - Spacer
                    HStack {
                        Text("")
                    }
                    //MARK: - Comments
                    HStack {
                        textAndColor(name: "    //time for concentration", color: Helper.Colors.comments)
                    }
                    //MARK: - Init()
                    HStack {
                        
                        Text("\(textAndColor(name: "    init", color: Helper.Colors.variable).bold())\(textAndColor(name: "()", color: Helper.Colors.brackets))")
                        textAndColor(name: "{", color: Helper.Colors.brackets)
                    }
                    
                    //MARK: - Action
                    HStack {
                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
                        textAndColor(name: "action", color: Helper.Colors.variableName)
                        + textAndColor(name: ":", color: Helper.Colors.brackets)
                        textAndColor(name: "Mood", color: Helper.Colors.type)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: ".\(currentMood.rawValue)", color: Helper.Colors.ifElseCondition)
                    }
                    .onTapGesture {
                        switch currentMood {
                        case .coding:
                            currentMood = .reading
                        case .reading:
                            currentMood = .cooking
                        case .cooking:
                            currentMood = .coding
                        }
                        generateHapticFeedback(style: .light)
                    }
                    
                    //MARK: - Focus
                    HStack {
                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
                        textAndColor(name: "focus", color: Helper.Colors.variableName)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        
                        textAndColor(name: "\"", color: Helper.Colors.string)
                        + textAndColor(name: "\\", color: Helper.Colors.white)
                        + textAndColor(name: "(", color: Helper.Colors.white)
                        + textAndColor(name: String(format: "%.0f",timerCount / 60), color: Helper.Colors.number).bold().font(.title3).monospacedDigit()
                        + textAndColor(name: ")", color: Helper.Colors.white)
                        + textAndColor(name: " minutes", color: Helper.Colors.string)
                        + textAndColor(name: "\"", color: Helper.Colors.string)
                    }
                    
                    HStack {
                        textAndColor(name: "    }", color: Helper.Colors.brackets)
                    }
                    //MARK: - End of class
                    textAndColor(name: "}", color: Helper.Colors.brackets)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
    }
}
