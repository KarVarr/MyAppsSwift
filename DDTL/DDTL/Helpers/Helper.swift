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
        
        enum NavTitle {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .myListViewController: "Don't Do This"
                case .worldListViewController: "Don't Do This World"
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
    }
    
    //MARK: - Images
    enum Images {
        static func images(for tab: Tabs) -> UIImage {
            switch tab {
            case .myListViewController: UIImage(systemName: "list.dash.header.rectangle") ?? UIImage()
            case .worldListViewController: UIImage(systemName: "list.bullet.rectangle") ?? UIImage()
            }
        }
    }
    
    //MARK: - Colors
    enum Colors {
        static let palePink = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)
        static let lightPink = UIColor(red: 1.00, green: 0.87, blue: 0.87, alpha: 1.00)
        static let pink = UIColor(red: 0.97, green: 0.46, blue: 0.67, alpha: 1.00)
        static let lightBlue = UIColor(red: 0.68, green: 0.87, blue: 0.99, alpha: 1.00)
        static let blue = UIColor(red: 0.00, green: 0.66, blue: 1.00, alpha: 1.00)
        static let darkGreen = UIColor(red: 0.23, green: 0.30, blue: 0.22, alpha: 1.00)
        static let placeholder = UIColor(red: 0.66, green: 0.66, blue: 0.66, alpha: 0.8)
    }
}

