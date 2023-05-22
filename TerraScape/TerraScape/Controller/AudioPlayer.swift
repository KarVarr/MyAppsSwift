//
//  AudioPlayer.swift
//  TerraScape
//
//  Created by Karen Vardanian on 15.05.2023.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer


class AudioPlayerForSound {
    let allSounds = AllSounds()
    let name = Images()
    
    var players: [AVAudioPlayer] = []
    
    init() {
        for sound in allSounds.sounds {
            if let path = Bundle.main.path(forResource: sound.name, ofType: "mp3") {
                let url = URL(filePath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.numberOfLoops = -1
                    player.prepareToPlay()
                    players.append(player)
                    
                } catch {
                    print("Failed to create audio player: \(error.localizedDescription)")
                }
            }
        }
    }
    
     
    
    
}
