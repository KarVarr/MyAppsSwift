//
//  ContentView.swift
//  Pidget
//
//  Created by Karen Vardanian on 15.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentImageIndex = 1
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    //MARK: - Colors
    var mainGreenColor: Color {
        return Color(UIColor(red: 0.14, green: 1.00, blue: 0.06, alpha: 1.00))
    }
    var mainBackgroundDarkColor: Color {
        return Color(UIColor(red: 0.11, green: 0.07, blue: 0.07, alpha: 1.00))
    }
    
    //MARK: - Layout Constants
    var widthStats: CGFloat = 0.1
    var heightStats: CGFloat = 0.03
    var widthGunAndArmour = 0.15
    var widthTargetEct = 0.05
    
    
    var body: some View {
        ZStack {
            Color(mainBackgroundDarkColor)
                .ignoresSafeArea()
            GeometryReader { geometry in
                //MARK: - TOP BAR
                VStack {
                    HStack {
                        Spacer()
                        Text("STAT")
                        Spacer()
                        Text("INV")
                        Spacer()
                        Text("DATA")
                        Spacer()
                        Text("MAP")
                        Spacer()
                    }
                    .bold()
                    .font(.custom("ArialRoundedMTBold", size: 24)).monospaced()
                    .padding(.bottom, -5)
                    Divider()
                        .frame(height: 2)
                        .background(mainGreenColor)
                    
                    
                    //MARK: - PIP BOY IMG
                    GeometryReader { geo in
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(width: geo.size.width * widthStats, height: geo.size.height * heightStats)
                                Spacer()
                                Rectangle()
                                    .frame(width: geo.size.width * widthStats, height: geo.size.height * heightStats)
                                Spacer()
                            }
                            Spacer()
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(width: geo.size.width * widthStats, height: geo.size.height * heightStats)
                                Spacer()
                                Image("pipBoy\(currentImageIndex)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .saturation(2.5)
                                    .brightness(0.15)
                                    .frame(maxWidth: geo.size.width * 0.4, maxHeight: geo.size.height * 0.6)
                                Spacer() 
                                Rectangle()
                                    .frame(width: geo.size.width * widthStats, height: geo.size.height * heightStats)
                                Spacer()
                            }
                            .padding(.vertical, 20)
                            .onReceive(timer, perform: { _ in
                                currentImageIndex = (currentImageIndex % 8) + 1
                            })
                            Spacer()
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(width: geo.size.width * widthStats, height: geo.size.height * heightStats)
                                Spacer()
                                Rectangle()
                                    .frame(width: geo.size.width * widthStats, height: geo.size.height * heightStats)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    //MARK: - GUN HELMET etc
                    GeometryReader { geo in
                        VStack {
                            HStack {
                                Spacer()
                                HStack {
                                    Image("gun")
                                        .resizable()
                                        .frame(width: geo.size.width * widthGunAndArmour,height: geo.size.width * widthGunAndArmour)
                                        .padding(2)
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 3)
                                        .background(.green.opacity(0.2))
                                    Spacer().frame(width: 2)
                                    VStack {
                                        Image("target")
                                            .resizable()
                                            .frame(width: geo.size.width * widthTargetEct,height: geo.size.height * widthTargetEct)
                                        Text("22")
                                            .font(.title)
                                    }
                                    .padding(2)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 3)
                                    .background(.green.opacity(0.2))
                                }
                                
                                
                                Image("helmet")
                                    .resizable()
                                    .frame(width: geo.size.width * widthGunAndArmour,height: geo.size.width * widthGunAndArmour)
                                    .padding(2)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 3)
                                    .background(.green.opacity(0.2))
                                Spacer().frame(width: 2)
                                VStack {
                                    Image("lightning")
                                        .resizable()
                                        .frame(width: geo.size.width * widthTargetEct,height: geo.size.height * widthTargetEct)
                                    Text("10")
                                        .font(.title)
                                }
                                .padding(2)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 3)
                                .background(.green.opacity(0.2))
                                Spacer().frame(width: 2)
                                VStack {
                                    Image("biohazard")
                                        .resizable()
                                        .frame(width: geo.size.width * widthTargetEct,height: geo.size.height * widthTargetEct)
                                    Text("15")
                                        .font(.title)
                                }
                                .padding(2)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 3)
                                .background(.green.opacity(0.2))
                                Spacer()
                            }
                            Text("User")
                        }
                        
                    }
                    //MARK: - BOTTOM BAR
                    HStack {
                        Spacer()
                        Text("HP 90/90")
                            .padding(4)
                            .background(mainGreenColor.opacity(0.2))
                        Spacer(minLength: 4)
                        HStack {
                            Text("Level 35")
                                .padding(4)
                            ZStack {
                                Rectangle()
                                    .stroke(lineWidth: 2)
                                    .padding(.leading,-5)
                                    .frame(maxHeight: 10)
                                    .padding(.trailing)
                                GeometryReader { geometry in
                                    Rectangle()
                                        .frame(width: 35 * geometry.size.width / 100)
                                }
                                .padding(.leading,-5)
                                .frame(maxHeight: 10)
                                .padding(.trailing)
                            }
                        }
                        .background(mainGreenColor.opacity(0.2))
                        Spacer(minLength: 4)
                        Text("AP 70/70")
                            .padding(4)
                            .background(mainGreenColor.opacity(0.2))
                        Spacer()
                    }
                    Spacer()
                }
                .foregroundStyle(mainGreenColor)
                .font(.system(size: 24)).bold()
                .fontWidth(.condensed)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    ContentView()
}
