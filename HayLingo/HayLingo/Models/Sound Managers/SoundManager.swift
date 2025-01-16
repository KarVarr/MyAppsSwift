//
//  SoundManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 26.11.2024.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private var soundPlayer: AVAudioPlayer?
    private let maxVolume: Float = 0.2
    
            
        func playSound(name: String) {
            
            guard let soundURL = Bundle.main.url(forResource: name, withExtension: "mp3") else {
                print("Sound file not found.")
                return
            }
            
            do {
                soundPlayer = try AVAudioPlayer(contentsOf: soundURL)
                
                // Установка громкости
                let currentSystemVolume = AVAudioSession.sharedInstance().outputVolume
                let targetVolume = min(maxVolume, currentSystemVolume)
                soundPlayer?.volume = targetVolume
                
                soundPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
        
        // Метод для обновления громкости при изменении системной громкости
        func updateVolume() {
            let currentSystemVolume = AVAudioSession.sharedInstance().outputVolume
            let targetVolume = min(maxVolume, currentSystemVolume)
            soundPlayer?.volume = targetVolume
        }
        
        init() {
            // Настройка наблюдения за изменениями громкости
            try? AVAudioSession.sharedInstance().setCategory(.ambient)
            try? AVAudioSession.sharedInstance().setActive(true)
            
            // Добавляем наблюдателя за изменениями системной громкости
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(handleVolumeChange),
                name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"),
                object: nil
            )
        }
        
        @objc private func handleVolumeChange(_ notification: Notification) {
            updateVolume()
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
}
