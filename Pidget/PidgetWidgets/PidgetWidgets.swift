//
//  PidgetWidgets.swift
//  PidgetWidgets
//
//  Created by Karen Vardanian on 15.04.2024.
//

import WidgetKit
import SwiftUI


struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct PidgetWidgetsEntryView : View {
    @State private var currentImageIndex = 1
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: - Colors
    var mainGreenColor: Color {
        return Color(UIColor(red: 0.14, green: 1.00, blue: 0.06, alpha: 1.00))
    }
    var mainBackgroundDarkColor: Color {
        return Color(UIColor(red: 0.11, green: 0.07, blue: 0.07, alpha: 1.00))
    }
    
    //MARK: - Width Height stats
    var widthStats: CGFloat = 35
    var heightStats: CGFloat = 7
    
    
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(mainBackgroundDarkColor)
            //MARK: - TOP BAR
            VStack {
                HStack {
                    Text("STAT")
                    Spacer()
                    Text("INV")
                    Spacer()
                    Text("DATA")
                    Spacer()
                    Text("MAP")
                    
                }
                .bold()
                .font(.custom("ArialRoundedMTBold", size: 16)).monospaced()
                .padding(.bottom, -5)
                Divider()
                    .frame(height: 2)
                    .background(mainGreenColor)
                Spacer()
                
                //MARK: - PIP BOY IMG
                HStack {
                    Spacer()
                    VStack {
                        Spacer().frame(height: 80)
                        Rectangle()
                            .frame(width: widthStats, height: heightStats)
                        Spacer()
                        Rectangle()
                            .frame(width: widthStats, height: heightStats)
                        Spacer()
                    }
                    Spacer()
                    VStack {
                        Rectangle()
                            .frame(width: widthStats, height: heightStats)
                        Spacer()
                        Image("pipBoy\(currentImageIndex)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .saturation(2.5)
                            .brightness(0.15)
                            .frame(width: 100, height: 100)
                        Spacer()
                        Rectangle()
                            .frame(width: widthStats, height: heightStats)
                    }
                    .padding(.vertical, 20)
                    .onReceive(timer, perform: { _ in
                        currentImageIndex = (currentImageIndex % 8) + 1
                    })
                    Spacer()
                    VStack {
                        Spacer().frame(height: 80)
                        Rectangle()
                            .frame(width: widthStats, height: heightStats)
                        Spacer()
                        Rectangle()
                            .frame(width: widthStats, height: heightStats)
                        Spacer()
                    }
                    Spacer()
                }
                //MARK: - GUN HELMET etc
                VStack {
                    HStack {
                        HStack {
                            Image("gun")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .padding(2)
                                .padding(.horizontal, 4)
                                .background(.green.opacity(0.2))
                            Spacer().frame(width: 2)
                            VStack {
                                Image("target")
                                    .resizable()
                                    .frame(width: 11,height: 11)
                                Text("22")
                            }
                            .padding(2)
                            .padding(.horizontal, 4)
                            .background(.green.opacity(0.2))
                        }
                        
                        Image("helmet")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .padding(2)
                            .padding(.horizontal, 4)
                            .background(.green.opacity(0.2))
                        Spacer().frame(width: 2)
                        VStack {
                            Image("lightning")
                                .resizable()
                                .frame(width: 11,height: 11)
                            Text("10")
                        }
                        .padding(2)
                        .padding(.horizontal, 4)
                        .background(.green.opacity(0.2))
                        Spacer().frame(width: 2)
                        VStack {
                            Image("biohazard")
                                .resizable()
                                .frame(width: 11,height: 11)
                            Text("15")
                        }
                        .padding(2)
                        .padding(.horizontal, 4)
                        .background(.green.opacity(0.2))
                    }
                    Text("User")
                }
                //MARK: - BOTTOM BAR
                HStack {
                    Text("HP 90/90")
                        .padding(4)
                        .background(.green.opacity(0.2))
                    
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
                    .background(.green.opacity(0.2))
                    
                    Text("AP 70/70")
                        .padding(4)
                        .background(.green.opacity(0.2))
                }
            }
            .foregroundStyle(mainGreenColor)
            .font(.system(size: 12))
            .fontWidth(.condensed)
        }
        .containerBackground(for: .widget) {
            mainBackgroundDarkColor
        }
        
    }
}

struct PidgetWidgets: Widget {
    let kind: String = "PidgetWidgets"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            PidgetWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("Pidget Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemLarge])
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemLarge) {
    PidgetWidgets()
} timeline: {
    SimpleEntry(date: .now, configuration: ConfigurationAppIntent())
}
