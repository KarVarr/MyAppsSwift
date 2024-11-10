//
//  MainView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct MainView: View {
    @State private var selectedLanguage = "English"
    
    let languages: [String] = ["English", "Russian"]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    Text("HayLingo")
                        .foregroundStyle(Helper.ColorHex.red)
                        .frame(height: geometry.size.height / 6)
                        .font(.system(size: 46, weight: .bold, design: .monospaced))
                    
                    let vStackWidth = geometry.size.width * 0.7
                    
                    VStack {
                        Text("Select a language")
                            .foregroundLinearGradientArmenianFlag(colors: [.red, .red, .blue, .orange, .orange], startPoint: .top, endPoint: .bottom)
                        Picker("Language", selection: $selectedLanguage) {
                            ForEach(languages, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    
                    VStackContent(
                        title: "Previous lessons",
                        subtitle: "Language: English\nCorrect answers: 10/10",
                        width: vStackWidth,
                        backgroundColor: Helper.ColorHex.white,
                        textColor: Helper.ColorHex.darkGray,
                        spacing: 10,
                        alignment: .leading
                    )
                    
                    VStackContent(
                        title: "Your progress",
                        subtitle: "English: 10/10\nRussian: 10/10",
                        width: vStackWidth,
                        backgroundColor: Helper.ColorHex.white,
                        textColor: Helper.ColorHex.darkGray,
                        spacing: 1,
                        alignment: .leading
                    )
                    
                    VStackContent(
                        title: "History of Armenian language",
                        subtitle: nil,
                        width: vStackWidth,
                        backgroundColor: Helper.ColorHex.blue,
                        textColor: Helper.ColorHex.white,
                        spacing: 1,
                        alignment: .center
                    )
                    
                    
                    VStackContent(
                        title: "Play game",
                        subtitle: nil,
                        width: vStackWidth,
                        backgroundColor: Helper.ColorHex.orange,
                        textColor: Helper.ColorHex.white,
                        spacing: 1, alignment: .center
                    )
                    
                    
                }
                .frame(maxWidth: .infinity, minHeight: geometry.size.height)
            }
            .background(Helper.ColorHex.backgroundGray)
        }
    }
}

#Preview {
    MainView()
}
