//
//  Helper.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit


enum Helper {
    //MARK: - URLs
    enum URL {
        static let nasaPictureOfTheDayUrl = "https://api.nasa.gov/planetary/apod?api_key=\(Keys.nasaApiKey)"
    }
    
    //MARK: - Images
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .pictureOfDay: return UIImage(named: "photo")
                case .planets: return UIImage(named: "planet")
                case .images: return UIImage(named: "images")
                case .peoples: return UIImage(named: "peoples")
                }
            }
        }
    }
    
    //MARK: - Strings
    enum Strings {
        
        enum NavBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .pictureOfDay: return "Picture of The Day"
                case .planets: return "Planets"
                case .images: return "Space"
                case .peoples: return "People"
                }
            }
        }
    }
    
    //MARK: - Colors
    enum Colors {
        static let blueGradient = [UIColor(red: 0.15, green: 0.00, blue: 0.36, alpha: 0.6).cgColor, UIColor(red: 0.58, green: 0.00, blue: 1.00, alpha: 0.3).cgColor]
        static let pinkAndBlueGradient = [UIColor(red: 0.94, green: 0.20, blue: 0.85, alpha: 0.8).cgColor, UIColor(red: 0.54, green: 1.00, blue: 0.99, alpha: 0.4).cgColor]
        static let darkBlueGradient = [Helper.Colors.veryDarkBlue.cgColor, Helper.Colors.lightSkyBlue.cgColor]
        
        
        static let darkBlue = UIColor(red: 0.01, green: 0.05, blue: 0.24, alpha: 1.00)
        static let lightYellow = UIColor(red: 0.95, green: 0.97, blue: 0.63, alpha: 1.00)
        static let yellow = UIColor(red: 0.99, green: 1.00, blue: 0.00, alpha: 1.00)
        static let lightOrange = UIColor(red: 1.00, green: 0.85, blue: 0.23, alpha: 1.00)
        static let lightCyan = UIColor(red: 0.21, green: 0.64, blue: 0.62, alpha: 1.00)
        static let milkWhite = UIColor(red: 1.00, green: 0.96, blue: 0.88, alpha: 1.00)
        static let lightBlue = UIColor(red: 0.89, green: 0.95, blue: 1.00, alpha: 1.00)
        static let lightGray = UIColor(red: 0.87, green: 0.90, blue: 0.93, alpha: 1.00)
        static let darkMagenta = UIColor(red: 0.13, green: 0.64, blue: 0.62, alpha: 1.00)
        static let veryDarkBlue = UIColor(red: 0.01, green: 0.02, blue: 0.09, alpha: 1.00)
        static let lightSkyBlue = UIColor(red: 0.53, green: 0.60, blue: 0.98, alpha: 1.00)
        static let white = UIColor(white: 1, alpha: 1)
    }
    
    //MARK: - Fonts
    enum Font {
        static func AppleSDGothicNeoBold(with size: CGFloat) -> UIFont {
            UIFont(name: "AppleSDGothicNeo-Bold", size: size) ?? UIFont()
        }
        
        static func CopperplateBold (with size: CGFloat) -> UIFont {
            UIFont(name: "Copperplate-Bold", size: size) ?? UIFont()
        }
        
        static func Copperplate (with size: CGFloat) -> UIFont {
            UIFont(name: "Copperplate", size: size) ?? UIFont()
        }
        
        static func DINCondensedBold (with size: CGFloat) -> UIFont {
            UIFont(name: "DINCondensed-Bold", size: size) ?? UIFont()
        }
        
        static func noteworthyLight (with size: CGFloat) -> UIFont {
            UIFont(name: "Noteworthy-Light", size: size) ?? UIFont()
        }
        
        static func noteworthyBold (with size: CGFloat) -> UIFont {
            UIFont(name: "Noteworthy-Bold", size: size) ?? UIFont()
        }
    }
}
