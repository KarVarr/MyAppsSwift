//
//  Clock.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

struct Clock: View {

    
    
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
                        textAndColor(name: "PM", color: Helper.Colors.type)
                        textAndColor(name: "=", color: Helper.Colors.brackets)
                        textAndColor(name: "\(getCurrentTime())", color: Helper.Colors.number)
                    }
                    
//                    Text("""
//        var \(textAndColor(name:"time", color: Color(uiColor: Helper.Colors.type)))\(textAndColor(name:":",color: Color(uiColor: Helper.Colors.brackets))) PM = 22:01
//        var battery: Normal = 56%
//        
//        """
                    
                   
                    .onAppear(perform: {
                        
                    })
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
        dateFormatter.timeStyle = .medium
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
