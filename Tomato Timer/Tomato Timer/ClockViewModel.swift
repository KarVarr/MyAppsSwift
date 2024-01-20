//
//  ClockViewModel.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import Foundation
import SwiftUI

class ClockViewModel: ObservableObject {
    @Published var currentTime: String = ""
    
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    func startTimer() {
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
//            self?.updateTime()
//        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        currentTime = dateFormatter.string(from: Date())
    }
}
