//
//  AllSounds.swift
//  TerraScape
//
//  Created by Karen Vardanian on 19.05.2023.
//

import Foundation
import UIKit

class AllSounds {
    private let images = Images()
    
    var sounds: [Sound] = []
    
    init() {
        for value in images.allImages {
            sounds.append(Sound(name: value, volume: 0.0, image: value, onOff: true))
        }
    }
}



