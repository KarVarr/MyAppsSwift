//
//  MainView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) var context
    @Query var userData: [UserData]
    
    @State private var selectedLanguage = "Russian"
    
    let languages: [String] = ["Russian", "English"]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 20) {
                        AnimatedTextView()
                            .frame(height: geometry.size.height / 6)
                            .font(.system(size: 46, weight: .bold, design: .monospaced))
                        
                        Text("Hello Vania!")
                        
                        let vStackWidth = geometry.size.width * 0.7
                        
                        VStack {
                            Text("Select a language")
                                .foregroundLinearGradientArmenianFlag(colors: [.red, .red, .blue, .orange, .orange], startPoint: .top, endPoint: .bottom)
                            Picker("Language", selection: $selectedLanguage) {
                                ForEach(languages, id: \.self) {
                                    Text($0)
                                }
                            }
                            .onChange(of: selectedLanguage) {_, newValue in
                                if let user = userData.first {
                                    user.selectedLanguage = newValue
                                    do {
                                        try context.save()
                                        print("saved \(newValue)")
                                    } catch {
                                        print("Error saving user data: \(error)")
                                    }
                                } else {
                                    print("userData.first is nil")
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: vStackWidth)
                        }
                        
                        var correctAnswer: String {
                            if let user = userData.first {
                                return user.progress.map{"Language: English\nCorrect answers: \($0.correctAnswer) from \($0.totalQuestion)"}.joined()
                            } else {
                                return "No data"
                            }
                        }
                        
                        VStackContent(
                            title: "Previous lessons",
                            subtitle: correctAnswer,
                            width: vStackWidth,
                            backgroundColor: Helper.ColorHex.white,
                            textColor: Helper.ColorHex.darkGray,
                            spacing: 10,
                            alignment: .leading
                        )
                        
                        var subtitle: String {
                            if let user = userData.first {
                                return user.progress.map {
                                    "\($0.language): \($0.correctAnswer)/\($0.totalQuestion)"
                                }.joined(separator: "\n")
                            }
                            return "No progress yet"
                        }
                        
                        VStackContent(
                            title: "Your progress",
                            subtitle: subtitle,
                            width: vStackWidth,
                            backgroundColor: Helper.ColorHex.white,
                            textColor: Helper.ColorHex.darkGray,
                            spacing: 10,
                            alignment: .leading
                        )
                        
                        NavigationLink(destination: HistoryOfArmenianLanguageView()) {
                            VStackContent(
                                title: "History of Armenian language",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.blue,
                                textColor: Helper.ColorHex.white,
                                spacing: 1,
                                alignment: .center
                            )
                        }
                        
                        NavigationLink(destination: LettersView()) {
                            VStackContent(
                                title: "Play game",
                                subtitle: nil,
                                width: vStackWidth,
                                backgroundColor: Helper.ColorHex.orange,
                                textColor: Helper.ColorHex.white,
                                spacing: 1, alignment: .center
                            )
                        }
                        
                    }
                    .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                }
                .background(Helper.ColorHex.backgroundGray)
            }
        }
        .onAppear {
            if userData.isEmpty {
                let user = UserData(name: "User", selectedLanguage: "Russian")

                context.insert(user)
                
                do {
                    try context.save()
                } catch {
                    print("Error saving user data: \(error)")
                }
            }
        }
    }
}

#Preview {
    MainView()
}
