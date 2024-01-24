//
//  ClockView.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

enum TimeAMPM {
    case pm
    case am
}

struct ClockView: View {
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    @ObservedObject private var soundViewModel = SoundViewModel()
    @ObservedObject private var clockViewModel = ClockViewModel()
    
    @Binding var timerCount: CGFloat
    @State private var batteryLevel: Float = UIDevice.current.batteryLevel
    @State private var currentTimePeriod: TimeAMPM = .am
    @State private var currentDate: String = ""
    
    
    let screenHeight = UIScreen.main.bounds.height
    var fontSize: CGFloat = 18
    
    init(timerCount: Binding<CGFloat>  = .constant(0) ) {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        
        _currentTimePeriod = State(initialValue: hour < 12 ? .am : .pm)
        _timerCount = Binding(projectedValue: timerCount)
        _currentDate = State(initialValue: getCurrentDate())
        
        switch screenHeight {
        case 0..<600:
            fontSize = 13
        case 600..<800:
            fontSize = 15
        case 800..<1000:
            fontSize = 17
        default:
            fontSize = 19
        }
    }
    
    
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
                
                VStack(alignment: .leading) {
                    //MARK: - struct
                    HStack {
                        textAndColor(name: "struct", color: Helper.Colors.variable).bold()
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
                        Text("\(textAndColor(name: "time", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        switch currentTimePeriod {
                        case .am: textAndColor(name: "AM", color: Helper.Colors.type)
                        case .pm: textAndColor(name: "PM", color: Helper.Colors.type)
                        }
                        
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(clockViewModel.currentTime)", color: Helper.Colors.number).bold()
                    }
                    //MARK: - Battery
                    HStack {
                        
                        textAndColor(name: "    var", color: Helper.Colors.variable).bold()
                        Text("\(textAndColor(name: "battery", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        switch batteryViewModel.batteryLevel {
                        case 0..<20: textAndColor(name: "Low", color: Helper.Colors.type)
                        case 20..<60: textAndColor(name: "Medium", color: Helper.Colors.type)
                        case 60..<100: textAndColor(name: "Good", color: Helper.Colors.type)
                        default:
                            textAndColor(name: "N/A", color: Helper.Colors.type)
                        }
                        
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        Text("\(textAndColor(name: "\(batteryViewModel.batteryLevel)", color: Helper.Colors.number).bold())\(textAndColor(name: "%", color: Helper.Colors.number))")
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
                    
                    
                    HStack {
                        textAndColor(name: "       var", color: Helper.Colors.variable).bold()
                        Text("\(textAndColor(name: "focus", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        textAndColor(name: "Minuts", color: Helper.Colors.type)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: String(format: "%.0f",timerCount / 60), color: Helper.Colors.number).bold().font(.title3).monospacedDigit()
                        
                    }
                    
                    
                    HStack {
                        textAndColor(name: "    }", color: Helper.Colors.brackets)
                        
                    }
                    //MARK: - End of struct
                    textAndColor(name: "}", color: Helper.Colors.brackets)
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .onReceive(NotificationCenter.default.publisher(for: .NSCalendarDayChanged), perform: { _ in
                    currentDate = getCurrentDate()
                })
                
            }
    }
    
    //MARK: - Metods
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }
    
    private func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }
    
    private func textAndColor(name: String, color: UIColor) -> Text {
        return Text(name)
            .foregroundColor(Color(uiColor: color))
            .font(.system(size: fontSize, weight: .regular, design: .monospaced))
            
    }
    
}

#Preview {
    ClockView()
    
}
