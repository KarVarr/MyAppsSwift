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
        static let yellow = UIColor(red: 1.00, green: 0.77, blue: 0.21, alpha: 1.00)
        static let lightYellow = UIColor(red: 0.90, green: 0.82, blue: 0.51, alpha: 1.00)
        static let darkViolet = UIColor(red: 0.15, green: 0.00, blue: 0.36, alpha: 1.00)
    }
    
    enum Font {
        static func gillSansBold(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans-Bold", size: size) ?? UIFont()
        }
        
        static func snellRoundhand (with size: CGFloat) -> UIFont {
            UIFont(name: "SnellRoundhand", size: size) ?? UIFont()
        }
        
        static func americanTypewriter (with size: CGFloat) -> UIFont {
            UIFont(name: "AmericanTypewriter", size: size) ?? UIFont()
        }
        
        static func noteworthyLight (with size: CGFloat) -> UIFont {
            UIFont(name: "Noteworthy-Light", size: size) ?? UIFont()
        }
        
        static func noteworthyBold (with size: CGFloat) -> UIFont {
            UIFont(name: "Noteworthy-Bold", size: size) ?? UIFont()
        }
    }
    
    enum Alert {
        static func showNoInternetAlert(from viewController: UIViewController) {
            let alert = UIAlertController(title: "Bad connection", message: "Check your internet connection and try again!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            viewController.present(alert, animated: true)
        }
    }
}
