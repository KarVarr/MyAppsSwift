//
//  TabBarController.swift
//  DDTL
//
//  Created by Karen Vardanian on 30.10.2023.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
    }
    
    private func configureAppearance() {
        tabBar.tintColor = .magenta
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .green
        
        let controller = UINavigationController(rootViewController: ViewController())
        controller.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        setViewControllers([controller], animated: true)
    }
}
