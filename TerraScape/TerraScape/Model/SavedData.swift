//
//  SavedData.swift
//  TerraScape
//
//  Created by Karen Vardanian on 20.05.2023.
//

import Foundation
import CoreData
import UIKit

class SavedData {
    let allSounds = AllSounds()
    
    private let soundKey = "sound"
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save() {
        do {
            try context.save()
        } catch {
            print("Not saved \(error)")
        }
        
        //reload?
    }
    
//    func load() {
//        let request: NSFetchRequest<Sound> = Sound.fetchRequest()
//        do {
//            allSounds.sounds = try context.fetch(request)
//        } catch {
//            print("Load not work \(error)")
//        }
//    }
    
}
