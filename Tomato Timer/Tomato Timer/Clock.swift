//
//  Clock.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI
import AVFoundation

enum TimeAMPM {
    case pm
    case am
}

struct Clock: View {
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    @ObservedObject private var soundViewModel = SoundViewModel()
    @ObservedObject private var clockViewModel = ClockViewModel()
    
    @State private var batteryLevel: Float = UIDevice.current.batteryLevel
    @State private var currentTimePeriod: TimeAMPM
    
   
    init() {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        _currentTimePeriod = State(initialValue: hour < 12 ? .am : .pm)

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
                        textAndColor(name: "        let", color: Helper.Colors.variable).bold()
                        textAndColor(name: "date", color: Helper.Colors.variableName)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(getCurrentDate())", color: Helper.Colors.number).bold()
                    }
                    //MARK: - Time
                    HStack {
                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
                        Text("\(textAndColor(name: "time", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        switch currentTimePeriod {
                        case .am: textAndColor(name: "AM", color: Helper.Colors.type)
                        case .pm: textAndColor(name: "PM", color: Helper.Colors.type)
                        }
                        
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(getCurrentTime())", color: Helper.Colors.number).bold()
                    }
                    //MARK: - Battery
                    HStack {
                        
                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
                        Text("\(textAndColor(name: "battery", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        switch batteryViewModel.batteryLevel {
                        case 0..<20: textAndColor(name: "Low", color: Helper.Colors.type)
                        case 20..<60: textAndColor(name: "Medium", color: Helper.Colors.type)
                        case 60..<100: textAndColor(name: "Good", color: Helper.Colors.type)
                        default:
                            textAndColor(name: "N/A", color: Helper.Colors.type)
                        }
                        
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(batteryViewModel.batteryLevel)", color: Helper.Colors.number).bold()
                    }
                    //MARK: - Sound
                    HStack {
                        textAndColor(name: "        var", color: Helper.Colors.variable).bold()
                        Text("\(textAndColor(name: "sound", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        textAndColor(name: "Disabled", color: Helper.Colors.type)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        
                        soundViewModel.isSoundEnabled ? textAndColor(name: "false", color: Helper.Colors.variable).bold() : textAndColor(name: "true", color: Helper.Colors.variable).bold()
                        
                    }
                    //MARK: - End of struct
                    textAndColor(name: "}", color: Helper.Colors.brackets)
                    
                }
                
            }
    }
    
    //MARK: - Metods
    
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }
    
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: Date())
    }

    func textAndColor(name: String, color: UIColor) -> Text {
        return Text(name)
            .foregroundColor(Color(uiColor: color))
            
    }
    
}

#Preview {
    Clock()
}
