//
//  LetterTrainerViewModel.swift
//  HayLingo
//
//  Created by Karen Vardanian on 14.11.2024.
//

import Combine
import Foundation
import SwiftData

class LetterTrainerViewModel: ObservableObject {
    @Published var currentLetter: String = ""
    @Published var currentImage: String = ""
    @Published var answerChoices: [String] = []
    @Published var selectedChoice: String?
    @Published var progress: [ProgressData] = []
}

