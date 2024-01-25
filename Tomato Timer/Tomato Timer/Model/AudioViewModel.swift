//
//  AudioViewModel.swift
//  Tomato Timer
//
//  Created by Karen Vardanian on 25.01.2024.
//

import Foundation
import AVFoundation

class AudioViewModel: NSObject, AVAudioPlayerDelegate {
    static let shared = AudioViewModel()
    
    private var audioPlayer: AVAudioPlayer?
    
    func playSound() {
        if let audioFile = Bundle.main.url(forResource: "Portal", withExtension: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: audioFile)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer?.stop()
        audioPlayer = nil
        print("stop and nil")
    }
}
