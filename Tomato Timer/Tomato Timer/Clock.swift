//
//  Clock.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI

struct Clock: View {
    @State private var currentDate: String = ""
    
    var body: some View {
        Color(uiColor: Helper.Colors.background)
            .ignoresSafeArea()
            .overlay {
                
                VStack(alignment: .leading) {
                    //MARK: - struct
                    HStack {
                        Text("struct")
                            .foregroundStyle(Color(uiColor: Helper.Colors.variable))
                        Text("TomatoTimer")
                            .foregroundStyle(Color(uiColor: Helper.Colors.typeName))
                        Text("{")
                            .foregroundStyle(Color(uiColor: Helper.Colors.brackets))
                    }
                    //MARK: - current date
                    HStack {
                        Text("        var")
                            .foregroundStyle(Color(uiColor: Helper.Colors.variable))
                        Text("currentDate")
                            .foregroundStyle(Color(uiColor: Helper.Colors.variableName))
                        Text(":")
                            .foregroundStyle(Color(uiColor: Helper.Colors.brackets))
                            
                        Text("PM")
                            .foregroundStyle(Color(uiColor: Helper.Colors.type))
                        Text("=")
                            .foregroundStyle(Color(uiColor: Helper.Colors.brackets))
                        Text("\(currentDate)")
                            .foregroundStyle(Color(uiColor: Helper.Colors.number))
                        
                    }
                    
                    Text("""
        var time: PM = 22:01
        var battery: Normal = 56%
        
        """
                    )
                    .foregroundStyle(.pink)
                    .onAppear(perform: {
                        
                    })
                }
            }
    }
    
    func variable(name: String, color: any ShapeStyle) -> String{
        return name
    }
}

#Preview {
    Clock()
}
