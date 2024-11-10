//
//  MainView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 10.11.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    Text("HayLingo")
                        .foregroundLinearGradientArmenianFlag(colors: [.red, .red, .blue, .orange, .orange], startPoint: .top, endPoint: .bottom)
                        .frame(height: geometry.size.height / 6)
                        .font(.system(size: 72, weight: .bold, design: .monospaced))
                    
                    
                    VStack {
                        VStack {
                            Text("Selected language:")
                                .font(.headline)
                            Text("English")
                                .font(.subheadline)
                        }                        .foregroundStyle(Helper.ColorHex.darkGray)
                    }
                    .padding()
                    .background(Helper.ColorHex.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 20, x: 4, y: 4)
                    .onTapGesture {
                        print("language selected")
                    }
                    
                    
                    VStack{
                        Text("Information about your previous lessons")
                        Text("Language: English")
                        Text("Correct answers: 10/10")
                    }
                    .padding()
                    .background(Helper.ColorHex.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 20, x: 4, y: 4)
                    .onTapGesture {
                        print("language selected")
                    }
                    
                    VStack{
                        Text("Your progress")
                        HStack {
                            Text("English")
                            Text("10/10")
                        }
                        HStack {
                            Text("Russian")
                            Text("10/10")
                        }
                        HStack {
                            Text("English")
                            Text("10/10")
                        }
                    }
                    .padding()
                    .background(Helper.ColorHex.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 20, x: 4, y: 4)
                    .onTapGesture {
                        print("language selected")
                    }
                    
                    VStack{
                        Text("History of Armenian language")
                    }
                    .padding()
                    .background(Helper.ColorHex.blue)
                    .foregroundStyle(Helper.ColorHex.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 20, x: 4, y: 4)
                    .onTapGesture {
                        print("language selected")
                    }

                    
                    VStack{
                        Text("Play game")
                    }
                    .padding()
                    .background(Helper.ColorHex.orange)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 20, x: 4, y: 4)
                    .onTapGesture {
                        print("language selected")
                    }
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
