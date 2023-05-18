//
//  AudioPlayer.swift
//  TerraScape
//
//  Created by Karen Vardanian on 15.05.2023.
//
import Foundation
import UIKit
import AVFoundation

class AudioPlayer {
//    var players: [AVAudioPlayer] = []
    var players: [AVAudioPlayer] = []
    
    func playSound(for soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        if let existingPlayer = players.first(where: { $0.url == url }) {
            existingPlayer.stop()
            players.removeAll(where: {$0.url == url})
            return
        } else {
            do {
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                players.append(audioPlayer)
            } catch {
                print("Failed to create AVAudioPlayer: \(error)")
            }
        }
    }
    
//    func stopSound(_ soundName: String) {
//        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
//        let url = URL(fileURLWithPath: path)
//        if let existingPlayer = players.first(where: { $0.url == url }) {
//            existingPlayer.stop()
//            players.removeAll(where: {$0.url == url})
//        }
//    }
   
    
}

