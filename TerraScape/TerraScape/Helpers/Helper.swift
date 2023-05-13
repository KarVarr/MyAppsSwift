//
//  Strings + Keys.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import Foundation
import UIKit


enum Helpers {
    
    enum Keys {
        static let collectionCell = "customCollectionCell"
    }
    
    enum Strings {
        static let navigationTitle = "TerraScape"
    }
    
    enum Colors {
        static let whiteGradient = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.4).cgColor]
        static let mainViewGradient = [UIColor(red: 0.63, green: 0.50, blue: 0.88, alpha: 1.00).cgColor, UIColor(red: 0.14, green: 0.14, blue: 0.24, alpha: 1.00).cgColor]
    }
    
    enum Radius {
        static let cornerRadius = 30.0
    }
    
}
