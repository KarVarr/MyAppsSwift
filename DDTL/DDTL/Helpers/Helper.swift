//
//  Helper.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import UIKit

enum Helper {
    //MARK: - STRINGS
    enum Strings {
        
        enum NavBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .myListViewController: "My list"
                case .worldListViewController: "World list"
                }
            }
        }
    }
    
    enum Images {
        static func images(for tab: Tabs) -> UIImage {
            switch tab {
            case .myListViewController: UIImage(systemName: "list.dash.header.rectangle") ?? UIImage()
            case .worldListViewController: UIImage(systemName: "list.bullet.rectangle") ?? UIImage()
            }
        }
    }
}

