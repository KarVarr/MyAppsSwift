//
//  VolumeObserver.swift
//  Pulse Ride
//
//  Created by Karen Vardanian on 07.09.2024.
//

import SwiftUI
import AVFoundation

class VolumeObserver: ObservableObject {
    @Published var isVolumeButtonPressed = false
    private var lastVolume: Float = AVAudioSession.sharedInstance().outputVolume
    private var volumeObserver: NSKeyValueObservation?
    
    init() {
        setupVolumeObserver()
    }
    
    func setupVolumeObserver() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setActive(true)
        } catch {
            print("Error activating audio session: \(error)")
        }
        
        volumeObserver = audioSession.observe(\.outputVolume, options: [.new]) { [weak self] (session, change) in
            guard let self = self else { return }
            if let newVolume = change.newValue, newVolume != self.lastVolume {
                self.lastVolume = newVolume
                DispatchQueue.main.async {
                    self.isVolumeButtonPressed = true
                    // Reset the flag after a short delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.isVolumeButtonPressed = false
                    }
                }
            }
        }
    }
    
    func invalidateObserver() {
        volumeObserver?.invalidate()
    }
    
    deinit {
        invalidateObserver()
    }
}


