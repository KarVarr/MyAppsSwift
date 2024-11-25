//
//   UserData.swift
//  HayLingo
//
//  Created by Karen Vardanian on 12.11.2024.
//

import Foundation
import SwiftData

@Model
class UserData {
    @Attribute(.unique) var id: UUID
    var name: String?
    var selectedLanguage: String
    var progress: [ProgressData]

    init(name: String, selectedLanguage: String, progress: [ProgressData] = []) {
        self.id = UUID()
        self.name = name
        self.selectedLanguage = selectedLanguage
        self.progress = progress
    }
}
