//
//  Helper.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

enum Helper {
    enum Keys {
        static let tableViewCellKey = "myListCell"
    }
    //MARK: - STRINGS
    enum Strings {
        enum AddNewTaskVC {
            static let title = "A D D   T A S K"
            static let textViewPlaceholder = "Describe your idea in detail here..."
            static let textFieldPlaceholder = "Type here some text"
        }
        
        enum NavTitle {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .myListViewController: "Don't Do This"
                case .worldListViewController: "World list"
                }
            }
        }
        
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .myListViewController: "My list"
                case .worldListViewController: "World list"
                }
            }
        }
        
        enum MyListVC {
            static let titleTop = "CREATE"
            static let titleMiddle = "A"
            static let titleBottom = "TASK"
        }
    }
    
    //MARK: - Images
    enum Images {
        static func images(for tab: Tabs) -> UIImage {
            switch tab {
//            case .myListViewController: UIImage(systemName: "list.dash.header.rectangle") ?? UIImage()
//            case .worldListViewController: UIImage(systemName: "list.bullet.rectangle") ?? UIImage()
            case .myListViewController: UIImage(named: "person") ?? UIImage()
            case .worldListViewController: UIImage(named: "world") ?? UIImage()
            }
        }
    }
    
    //MARK: - Colors
    enum Colors {
        static let mainColorFromIcon = UIColor(red: 0.35, green: 0.66, blue: 0.65, alpha: 1.00)
        static let placeholder = UIColor(red: 0.66, green: 0.66, blue: 0.66, alpha: 0.8)
        static let beige = UIColor(red: 0.91, green: 0.81, blue: 0.73, alpha: 1.00)
        static let redOrange = UIColor(red: 0.98, green: 0.18, blue: 0.18, alpha: 1.00)
        static let blue = UIColor(red: 0.00, green: 0.66, blue: 1.00, alpha: 1.00)
        static let darkBlue = UIColor(red: 0.15, green: 0.15, blue: 0.23, alpha: 1.00)
        static let lightBlue = UIColor(red: 0.68, green: 0.87, blue: 0.99, alpha: 1.00)
        static let pink = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        static let palePink = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)
        static let lightPink = UIColor(red: 1.00, green: 0.87, blue: 0.87, alpha: 1.00)
        static let darkGreen = UIColor(red: 0.23, green: 0.30, blue: 0.22, alpha: 1.00)
        static let black = UIColor(red: 0.09, green: 0.08, blue: 0.08, alpha: 1.00)
    }
    
    //MARK: - Fonts
    enum Fonts {
        static func ChalkboardSERegular(with size: CGFloat) -> UIFont {
            UIFont(name: "ChalkboardSE-Regular", size: size) ?? UIFont()
        }
        
        static func BungeeShadeRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "BungeeShade-Regular", size: size) ?? UIFont()
        } 
        
        static func BlackOpsOneRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "BlackOpsOne-Regular", size: size) ?? UIFont()
        }
        
        static func RighteousRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Righteous-Regular", size: size) ?? UIFont()
        }
        
    }
}

