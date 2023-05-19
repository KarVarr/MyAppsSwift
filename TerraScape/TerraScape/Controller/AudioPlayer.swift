//
//  AudioPlayer.swift
//  TerraScape
//
//  Created by Karen Vardanian on 15.05.2023.
//

import UIKit
import AVFoundation

//class AudioPlayer {
////    var players: [AVAudioPlayer] = []
//    var players: [AVAudioPlayer] = []
//
//    func playSound(for soundName: String) {
//        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
//        let url = URL(fileURLWithPath: path)
//
//        if let existingPlayer = players.first(where: { $0.url == url }) {
//            existingPlayer.stop()
//            players.removeAll(where: {$0.url == url})
//            return
//        } else {
//            do {
//                let audioPlayer = try AVAudioPlayer(contentsOf: url)
//                audioPlayer.numberOfLoops = -1
//                audioPlayer.prepareToPlay()
//                audioPlayer.play()
//                players.append(audioPlayer)
//            } catch {
//                print("Failed to create AVAudioPlayer: \(error)")
//            }
//        }
//    }
//
//
//}

class AudioPlayerForSound {
    let allSounds = AllSounds()
    
    var players: [AVAudioPlayer] = []
    
    init() {
        for sound in allSounds.sounds {
            if let path = Bundle.main.path(forResource: sound.name, ofType: "mp3") {
                let url = URL(filePath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    players.append(player)
                } catch {
                    print("Failed to create audio player: \(error.localizedDescription)")
                }
            }
        }
    }
}
