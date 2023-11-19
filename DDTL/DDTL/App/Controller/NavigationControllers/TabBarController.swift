//
//  TabBarController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import Foundation
import UIKit

enum Tabs: Int, CaseIterable {
    case myListViewController
    case worldListViewController
}

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
    }
    
    private func configureAppearance() {
        tabBar.tintColor = Helper.Colors.pink
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = Helper.Colors.palePink
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            
            let controller = NavBarController(rootViewController: getController(for: tab))
            
            
            
            controller.tabBarItem = UITabBarItem(
                title: Helper.Strings.TabBar.title(for: tab),
                image: Helper.Images.images(for: tab).resized(to: CGSize(width: 28, height: 28)),
                tag: tab.rawValue)
            
            return controller
        }
        
        setViewControllers(controllers, animated: true)
    }
    
    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .myListViewController: MyListViewController()
        case .worldListViewController: WorldListViewController()
        }
    }
}



