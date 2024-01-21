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

        NotificationCenter.default.addObserver(self, selector: #selector(soundStatusDidChange(notification:)), name: AVAudioSession.silenceSecondaryAudioHintNotification, object: nil)
    }

    @objc func soundStatusDidChange(notification: Notification) {
        if let userInfo = notification.userInfo,
           let typeRawValue = userInfo[AVAudioSessionSilenceSecondaryAudioHintTypeKey] as? UInt,
           let type = AVAudioSession.SilenceSecondaryAudioHintType(rawValue: typeRawValue) {
            self.isSoundEnabled = type != .begin
        }
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

