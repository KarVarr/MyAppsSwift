//
//  ExtensionNotificationCenter.swift
//  HayLingo
//
//  Created by Karen Vardanian on 08.12.2024.
//

import Foundation

extension Notification.Name {
    static let languageDidChange = Notification.Name("languageDidChange")
    static let soundSettingsDidChange = Notification.Name("soundSettingsDidChange")
    static let vibrationSettingsDidChange = Notification.Name("vibrationSettingsDidChange")
    static let progressDataDidChange = Notification.Name("progressDataDidChange")
}
