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
        static let cellBackgroundColor = UIColor(red: 0.23, green: 0.60, blue: 0.73, alpha: 1.00)
        
        static let navigationBarBackgroundColor = UIColor.clear
        
        static let deselectWhiteGradient = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.3).cgColor]
        static let selectWhiteGradient = [UIColor(white: 1, alpha: 0.5).cgColor, UIColor(white: 1, alpha: 0.8).cgColor]
        
        static let mainViewGradient = [UIColor(red: 0.07, green: 0.76, blue: 0.91, alpha: 1.00).cgColor, UIColor(red: 0.77, green: 0.44, blue: 0.93, alpha: 1.00).cgColor, UIColor(red: 0.96, green: 0.31, blue: 0.35, alpha: 1.00).cgColor]
        
        static let smallBallGradient = [UIColor(red: 0.40, green: 1.00, blue: 0.00, alpha: 1.00).cgColor, UIColor(red: 0.40, green: 1.00, blue: 0.60, alpha: 1.00).cgColor]
        
        static let mediumBallGradient = [UIColor(red: 0.22, green: 0.42, blue: 0.99, alpha: 1.00).cgColor, UIColor(red: 0.16, green: 0.28, blue: 1.00, alpha: 1.00).cgColor]
        
        static let bigBallGradient = [UIColor(red: 1.00, green: 0.89, blue: 0.35, alpha: 1.00).cgColor, UIColor(red: 1.00, green: 0.65, blue: 0.32, alpha: 1.00).cgColor]
        
        static let largeBallGradient = [UIColor(red: 0.01, green: 0.00, blue: 0.12, alpha: 1.00).cgColor,UIColor(red: 0.45, green: 0.01, blue: 0.75, alpha: 1.00).cgColor, UIColor(red: 0.93, green: 0.22, blue: 0.74, alpha: 1.00).cgColor]
        
        
        static let sliderTrackMinimumColor = UIColor(red: 1.00, green: 1.00, blue: 0.53, alpha: 1.00)
        
    }
    
    enum Radius {
        static let cornerRadius = 30.0
    }
    
}
