//
//  ProgressData.swift
//  HayLingo
//
//  Created by Karen Vardanian on 12.11.2024.
//

import Foundation
import SwiftData

@Model
class ProgressData {
    var language: String
    var correctAnswer: Int
    var totalQuestion: Int

    init(language: String, correctAnswer: Int, totalQuestion: Int) {
        self.language = language
        self.correctAnswer = correctAnswer
        self.totalQuestion = totalQuestion
    }
}
