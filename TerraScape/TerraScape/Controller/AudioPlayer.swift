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
    
    var player: AVAudioPlayer?
    
    func playSound(for soundName: String) {
        
            //            let audioSession = AVAudioSession.sharedInstance()
            //            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            //            try audioSession.setActive(true)
            
            guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
            
            let url = URL(fileURLWithPath: path)
            
            player = try! AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        
    }
    
}
