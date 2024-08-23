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
    private let images = Images()
    private var players: [String: AVAudioPlayer] = [:]
    
    init() {
        for sound in images.allImages {
            if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
                let url = URL(filePath: path)
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.numberOfLoops = -1
                    player.prepareToPlay()
                    player.volume = 0.0
                    players[sound] = player
                } catch {
                    print("Failed to create audio player for \(sound): \(error)")
                }
            }
        }
    }

    func play(sound: String) {
        players[sound]?.play()
    }
    
    func stop(sound: String) {
        players[sound]?.stop()
    }
    
    func setVolume(for sound: String, volume: Float) {
        players[sound]?.volume = volume
    }
    
    func playAllSounds() {
        players.forEach { (sound, player) in
            if !player.isPlaying {
                player.play()
                print("Playing \(sound) at volume \(player.volume)")
            }
        }
    }
    
    func stopAllSounds() {
        players.values.forEach { $0.stop() }
    }
}

//final class AudioPlayerForSound {
//    let images = Images()
//    var players: [AVAudioPlayer] = []
//    
//    init() {
//        for sound in images.allImages {
//            if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
//                let url = URL(filePath: path)
//                do {
//                    let player = try AVAudioPlayer(contentsOf: url)
//                    player.numberOfLoops = -1
////                    player.prepareToPlay()
//                    player.volume = 0.0
//                    players.append(player)
//                } catch let error as NSError {
//                    print("Failed to create audio player: \(error)")
//                }
//            }
//            
//        }
//    }
//
//    func playAllSounds() {
//        players.forEach{$0.play()}
//    }
//    
//    func stopAllSounds() {
//        players.forEach{$0.stop()}
//    }
//}
