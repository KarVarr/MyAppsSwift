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
        static let mainViewGradient = [UIColor(red: 0.03, green: 0.95, blue: 0.65, alpha: 1.00).cgColor, UIColor(red: 0.14, green: 0.22, blue: 0.73, alpha: 1.00).cgColor]
        static let largeBallGradient = [UIColor(red: 0.01, green: 0.00, blue: 0.12, alpha: 1.00).cgColor,UIColor(red: 0.45, green: 0.01, blue: 0.75, alpha: 1.00).cgColor, UIColor(red: 0.93, green: 0.22, blue: 0.74, alpha: 1.00).cgColor]
    }
    
    enum Radius {
        static let cornerRadius = 30.0
    }
    
}
