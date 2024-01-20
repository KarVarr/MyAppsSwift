//
//  Clock.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

class BatteryViewModel: ObservableObject {
    @Published var batteryLevel: Int = 0
    @Published var batteryStateDescription: String = ""
    @Published var batteryStateColor: UIColor = Helper.Colors.type
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
        getBatteryState()
    }
    
    private func getBatteryState() {
        let batteryState = UIDevice.current.batteryState
        self.batteryStateDescription = getBatteryDescription(for: batteryState)
        self.batteryStateColor = getBatteryColor(for: batteryState)
    }
    
    private func getBatteryColor(for state: UIDevice.BatteryState) -> UIColor {
        switch state {
        case .unknown:
            return Helper.Colors.type
        case .unplugged:
            return Helper.Colors.type
        case .charging:
            return Helper.Colors.ifElseCondition
        case .full:
            return Helper.Colors.type
        @unknown default:
            return Helper.Colors.type
        }
    }
    
    private func getBatteryDescription(for state: UIDevice.BatteryState) -> String {
        switch state {
        case .unknown:
            return "Unknown"
        case .unplugged:
            return "On battery power"
        case .charging:
            return "Charging"
        case .full:
            return "Full"
        @unknown default:
            return "Unknown"
        }
    }
}


struct Clock: View {
    enum TimeAMPM {
        case pm
        case am
    }
    
 
    
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
                        textAndColor(name: "struct", color: Helper.Colors.variable)
                        textAndColor(name: "TomatoTimer", color: Helper.Colors.typeName)
                        textAndColor(name: "{", color: Helper.Colors.brackets)
                    }
                    //MARK: - Date
                    HStack {
                        textAndColor(name: "        var", color: Helper.Colors.variable)
                        textAndColor(name: "date", color: Helper.Colors.variableName)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(getCurrentDate())", color: Helper.Colors.number)
                    }
                    //MARK: - Time
                    HStack {
                        textAndColor(name: "        var", color: Helper.Colors.variable)
                        Text("\(textAndColor(name: "time", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        switch currentTimePeriod {
                        case .am: textAndColor(name: "AM", color: Helper.Colors.type)
                        case .pm: textAndColor(name: "PM", color: Helper.Colors.type)
                        }
                        
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(getCurrentTime())", color: Helper.Colors.number)
                    }
                    //MARK: - Battery
                    HStack {
                        
                        textAndColor(name: "        var", color: Helper.Colors.variable)
                        Text("\(textAndColor(name: "battery", color: Helper.Colors.variableName))\(textAndColor(name: ":", color: Helper.Colors.brackets))")
                        
                        switch batteryLevel {
                        case 0.0..<20.0: textAndColor(name: "Low", color: Helper.Colors.type)
                        case 20.0..<60.0: textAndColor(name: "Medium", color: Helper.Colors.type)
                        case 60.0..<100.0: textAndColor(name: "Good", color: Helper.Colors.type)
                        default:
                            textAndColor(name: "N/A", color: Helper.Colors.type)
                        }
                    
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: String(format: "%.0f", batteryLevel * 100), color: Helper.Colors.number)
                    }
                    //MARK: - End of struct
                    textAndColor(name: "}", color: Helper.Colors.brackets)
                        .onAppear {
                            UIDevice.current.isBatteryMonitoringEnabled = true
                            
                            NotificationCenter.default.addObserver(
                                forName: UIDevice.batteryLevelDidChangeNotification,
                                object: nil,
                                queue: nil
                            ) { _ in
                                batteryLevel = UIDevice.current.batteryLevel
                            }
                        }
                        .onDisappear {
                            UIDevice.current.isBatteryMonitoringEnabled = false
                        }
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
            .foregroundStyle(Color(uiColor: color))
    }
}

#Preview {
    Clock()
}
