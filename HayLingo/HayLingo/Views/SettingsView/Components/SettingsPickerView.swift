//
//  SettingsPickerView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 03.01.2025.
//

import SwiftUI

struct SettingsPickerView: View {
    let title: String
    let options: [String]
    @Binding var selection: String
    let width: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 12))
                .foregroundStyle(Helper.ColorHex.lightBlack)
            
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) {
                    Text($0)
                        .foregroundStyle(Helper.ColorHex.darkBlue)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: width)
        }
    }
}
