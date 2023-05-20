//
//  SavedData.swift
//  TerraScape
//
//  Created by Karen Vardanian on 20.05.2023.
//

import Foundation


class SavedData {
    let allSounds = AllSounds()
    
    private let soundKey = "sound"
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
//        if let savedData = try? jsonEncoder.encode(allSounds.sounds) {
//            let defaults = UserDefaults.standard
//            defaults.set(savedData, forKey: soundKey)
//        } else {
//            print("Failed to save sound!")
//        }
        do {
            let savedData = try jsonEncoder.encode(allSounds.sounds)
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: soundKey)
        } catch {
            print("Failed to save sound: \(error.localizedDescription)")
        }
    }
    
    
    func load() {
        let defaults = UserDefaults.standard
        
        if let savedData = defaults.object(forKey: soundKey) as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                allSounds.sounds = try jsonDecoder.decode([Sound].self, from: savedData)
            } catch {
                print("Failed to load sound \(error.localizedDescription)")
            }
        }
    }
}
