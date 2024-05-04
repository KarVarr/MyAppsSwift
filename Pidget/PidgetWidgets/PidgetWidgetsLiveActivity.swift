//
//  PidgetWidgetsLiveActivity.swift
//  PidgetWidgets
//
//  Created by Karen Vardanian on 15.04.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PidgetWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PidgetWidgetsLiveActivity: Widget {
    let kind: String = "PidgetWidgetsLiveActivity"
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PidgetWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PidgetWidgetsAttributes {
    fileprivate static var preview: PidgetWidgetsAttributes {
        PidgetWidgetsAttributes(name: "World")
    }
}

extension PidgetWidgetsAttributes.ContentState {
    fileprivate static var smiley: PidgetWidgetsAttributes.ContentState {
        PidgetWidgetsAttributes.ContentState(emoji: "😀")
    }
    
    fileprivate static var starEyes: PidgetWidgetsAttributes.ContentState {
        PidgetWidgetsAttributes.ContentState(emoji: "🤩")
    }
}



#Preview("Notification", as: .content, using: PidgetWidgetsAttributes.preview) {
    PidgetWidgetsLiveActivity()
} contentStates: {
    PidgetWidgetsAttributes.ContentState.smiley
    PidgetWidgetsAttributes.ContentState.starEyes
}
