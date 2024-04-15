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
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
            
                .fill(.black)
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
                
                Spacer()
                Image("pipBoy1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                Spacer()
                HStack {
                    
                    Text("HP 90/90")
                        .padding(2)
                        .background(.green.opacity(0.2))
                    
                    HStack {
                        Text("Level 35")
                            .padding(2)
                        Rectangle()
                            .stroke(lineWidth: 2)
                            .padding(.leading,-5)
                            .frame(maxHeight: 10)
                        
                    }
                    .background(.green.opacity(0.2))
                    Spacer()
                    Text("AP 70/70")
                        .padding(2)
                        .background(.green.opacity(0.2))
                    
                }
            }
            .foregroundStyle(.green)
            .font(.system(size: 13))
        }
        .containerBackground(for: .widget) {
            Color.black
        }
        
    }
}

struct PidgetWidgets: Widget {
    let kind: String = "PidgetWidgets"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            PidgetWidgetsEntryView(entry: entry)
//                .containerBackground(.fill.secondary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
//    fileprivate static var starEyes: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
//        return intent
//    }
}

#Preview(as: .systemLarge) {
    PidgetWidgets()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
//    SimpleEntry(date: .now, configuration: .starEyes)
}
