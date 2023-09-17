//
//  AudioPlayer.swift
//  TerraScape
//
//  Created by Karen Vardanian on 15.05.2023.
//

import UIKit
import AVFoundation
import MediaPlayer


final class AudioPlayerForSound {
    let images = Images()
    var players: [AVAudioPlayer] = []
    
    init() {
        for sound in images.allImages {
            if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
                let url = URL(filePath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.numberOfLoops = -1
                    player.prepareToPlay()
                    player.volume = 0.0
                    players.append(player)
                } catch let error as NSError {
                    print("Failed to create audio player: \(error)")
                }
            }
            
        }
    }

    func playAllSounds() {
        players.forEach{$0.play()}
    }
    
    func stopAllSounds() {
        players.forEach{$0.stop()}
    }
    
    
}
