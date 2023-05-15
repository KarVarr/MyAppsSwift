//
//  AudioPlayer.swift
//  TerraScape
//
//  Created by Karen Vardanian on 15.05.2023.
//

import AVFoundation

class AudioPlayer {
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "bonfireA", ofType: "aiff") else { return }
        
        let url = URL(filePath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
