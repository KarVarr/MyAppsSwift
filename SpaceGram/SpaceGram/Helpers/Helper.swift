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
    
    //MARK: - Strings
    enum String {
        static let titlePictureOfTheDay = "Picture of The Day"
    }
    
    //MARK: - Colors
    enum Colors {
        static let blueGradient = [UIColor(red: 0.15, green: 0.00, blue: 0.36, alpha: 0.7).cgColor, UIColor(red: 0.58, green: 0.00, blue: 1.00, alpha: 0.4).cgColor]
        static let darkBlueGradient = [Helper.Colors.veryDarkBlue.cgColor, Helper.Colors.lightSkyBlue.cgColor]
        
        
        static let darkBlue = UIColor(red: 0.01, green: 0.05, blue: 0.24, alpha: 1.00)
        static let lightYellow = UIColor(red: 0.95, green: 0.97, blue: 0.63, alpha: 1.00)
        static let lightCyan = UIColor(red: 0.21, green: 0.64, blue: 0.62, alpha: 1.00)
        static let milkWhite = UIColor(red: 1.00, green: 0.96, blue: 0.88, alpha: 1.00)
        static let lightBlue = UIColor(red: 0.89, green: 0.95, blue: 1.00, alpha: 1.00)
        static let lightGray = UIColor(red: 0.87, green: 0.90, blue: 0.93, alpha: 1.00)
        static let darkMagenta = UIColor(red: 0.53, green: 0.36, blue: 1.00, alpha: 1.00)
        static let veryDarkBlue = UIColor(red: 0.01, green: 0.02, blue: 0.09, alpha: 1.00)
        static let lightSkyBlue = UIColor(red: 0.53, green: 0.60, blue: 0.98, alpha: 1.00)
    }
    
    //MARK: - Fonts
    enum Font {
            static func AppleSDGothicNeoBold(with size: CGFloat) -> UIFont {
                UIFont(name: "AppleSDGothicNeo-Bold", size: size) ?? UIFont()
            }
            
            static func CopperplateBold (with size: CGFloat) -> UIFont {
                UIFont(name: "Copperplate-Bold", size: size) ?? UIFont()
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
