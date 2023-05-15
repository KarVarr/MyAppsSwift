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
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "bonfireW", ofType: "wav") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
        
    }
    
}
