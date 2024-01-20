//
//  SoundViewModel.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 20.01.2024.
//

import SwiftUI
import AVFoundation


class SoundViewModel: ObservableObject {
    @Published var isSoundEnabled: Bool = true

    init() {
        observeSoundStatus()
        
        NotificationCenter.default.addObserver(self, selector: #selector(soundLevelDidChange(notification:)), name: AVAudioSession.mediaServicesWereResetNotification, object: nil)
    }
    
    @objc func soundLevelDidChange(notification: Notification) {
        self.isSoundEnabled = AVAudioSession.sharedInstance().isOtherAudioPlaying
    }

    func observeSoundStatus() {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
            isSoundEnabled = AVAudioSession.sharedInstance().isOtherAudioPlaying
        } catch {
            print("Error observing sound status \(error)")
        }
    }
}
