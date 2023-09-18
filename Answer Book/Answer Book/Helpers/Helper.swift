//
//  Helper.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

enum Helper {
    enum URL {
        static let answerUrl = "https://www.eightballapi.com/api"
        static let quotesUrl = "https://zenquotes.io/api/today"
    }
    
    enum String {
        static let quotesTitle = "Quote of the Day"
    }
    
    enum Colors {
        static let whiteGradient = [UIColor(white: 1, alpha: 0.15).cgColor, UIColor(white: 1, alpha: 0.3).cgColor]
    }
    
    enum Font {
        static func appleSDGothicNeoRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "AppleSDGothicNeo-Regular", size: size) ?? UIFont()
        }
        
        static func gillSansBold(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans-Bold", size: size) ?? UIFont()
        }
        
        static func thonburi (with size: CGFloat) -> UIFont {
            UIFont(name: "Thonburi", size: size) ?? UIFont()
        }
        
        static func snellRoundhand (with size: CGFloat) -> UIFont {
            UIFont(name: "SnellRoundhand", size: size) ?? UIFont()
        }
        
        static func americanTypewriter (with size: CGFloat) -> UIFont {
            UIFont(name: "AmericanTypewriter", size: size) ?? UIFont()
        }
    }
}
