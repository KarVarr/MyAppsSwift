//
//  SavedData.swift
//  TerraScape
//
//  Created by Karen Vardanian on 20.05.2023.
//

import Foundation


class SavedData {
    let allSounds = AllSounds()
    
    func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(allSounds.sounds) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "sound")
        } else {
            print("Failed to save sound!")
        }
    }
    
    
    func load() {
        let defaults = UserDefaults.standard
        
        if let savedData = defaults.object(forKey: "sound") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                allSounds.sounds = try jsonDecoder.decode([Sound].self, from: savedData)
            } catch {
                print("Failed to load sound!")
            }
        }
    }
}
