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
    
    func save(sounds: [Sound]) {
        let jsonEncoder = JSONEncoder()
        
        do {
            let savedData = try jsonEncoder.encode(sounds)
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: soundKey)
        } catch {
            print("Failed to save sound: \(error.localizedDescription)")
        }
    }
    
    
    func load() -> [Sound] {
        let defaults = UserDefaults.standard
        
        if let savedData = defaults.object(forKey: soundKey) as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                return try jsonDecoder.decode([Sound].self, from: savedData)
            } catch {
                print("Failed to load sound \(error.localizedDescription)")
            }
        }
        
        return []
    }

}
