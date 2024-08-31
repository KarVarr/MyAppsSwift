//
//  Strings + Keys.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import Foundation
import UIKit


enum Helpers {
    //MARK: - KEYS
    enum Keys {
        static let collectionCell = "customCollectionCell"
    }
    
    //MARK: - STRINGS
    enum Strings {
        static let navigationTitle = "TerraScape"
        static let settingsTitle = String(localized: "About")
        static let settingsAboutTitleLabel = "TerraScape"
        static let aboutVersionTitle = String(localized: "Version: ")
        static let settingsAboutText = String(localized: " ❝ Experience TerraScape, the ultimate productivity tool for staying focused and relaxed. Immerse yourself in a variety of ambient sounds, from gentle rain to the cozy warmth of a crackling fire. TerraScape works like magic, enhancing productivity while creating a serene environment!")
        
        enum AboutVC {
            static let rate = String(localized: "Rate")
            static let report = String(localized: "Report")
        }
        
        enum EmailReport {
            static let email = "vardaniankaren88@gmail.com"
            static let subject = "Bug in the app TerraScape"
            static let deviceName = UIDevice.current.modelName
            static let deviceModel = UIDevice.current.systemVersion
            static let deviceOsName = UIDevice.current.systemName
            static let messageBody = "<p>\(deviceName) \(deviceOsName) \(deviceModel)</p>"
        }
    }
    
    //MARK: - COLORS
    enum Colors {
        static let settingsWhite = UIColor.white
        
        static let cellBackgroundColor = UIColor(red: 0.23, green: 0.60, blue: 0.73, alpha: 1.00)
        
        static let navigationBarBackgroundColor = UIColor.clear
        
        static let deselectWhiteGradient = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.3).cgColor]
        static let selectWhiteGradient = [UIColor(red: 0.00, green: 0.78, blue: 1.00, alpha: 0.4).cgColor, UIColor(red: 0.00, green: 0.45, blue: 1.00, alpha: 0.4).cgColor]
        
        static let settingsViewBackground = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
        
        static let mainViewGradient = [UIColor(red: 0.07, green: 0.76, blue: 0.91, alpha: 1.00).cgColor, UIColor(red: 0.77, green: 0.44, blue: 0.93, alpha: 1.00).cgColor, UIColor(red: 0.96, green: 0.31, blue: 0.35, alpha: 1.00).cgColor]
        
        static let smallBallGradient = [UIColor(red: 1.00, green: 0.29, blue: 0.12, alpha: 1.00).cgColor, UIColor(red: 1.00, green: 0.56, blue: 0.41, alpha: 1.00).cgColor]
        
        static let mediumBallGradient = [UIColor(red: 0.22, green: 0.42, blue: 0.99, alpha: 1.00).cgColor, UIColor(red: 0.16, green: 0.28, blue: 1.00, alpha: 1.00).cgColor]
        
        static let bigBallGradient = [UIColor(red: 1.00, green: 0.89, blue: 0.35, alpha: 1.00).cgColor, UIColor(red: 1.00, green: 0.65, blue: 0.32, alpha: 1.00).cgColor]
        
        static let largeBallGradient = [UIColor(red: 0.01, green: 0.00, blue: 0.12, alpha: 1.00).cgColor,UIColor(red: 0.45, green: 0.01, blue: 0.75, alpha: 1.00).cgColor, UIColor(red: 0.93, green: 0.22, blue: 0.74, alpha: 1.00).cgColor]
        
        static let sliderTrackMinimumColor = UIColor.white
        static let toolbarSettingsButtonColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00)
    }
    
    //MARK: - RADIUS
    enum Radius {
        static let cellCornerRadius = 20.0
        static let buttonCornerRadius = 10.0
    }
    
    //MARK: - FONTS
    enum Fonts {
        static func AppleSDGothicNeoRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "AppleSDGothicNeo-Regular", size: size) ?? UIFont()
        }
        
        static func GillSansBold(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans-Bold", size: size) ?? UIFont()
        }
        
        static func Thonburi (with size: CGFloat) -> UIFont {
            UIFont(name: "Thonburi", size: size) ?? UIFont()
        }
    }
    
}
