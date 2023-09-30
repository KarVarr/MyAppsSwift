//
//  TabBarController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 29.09.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case pictureOfDay
    case planets
    case images
    case peoples
}

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        switchTo(tab: .planets)
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureAppearance() {
        tabBar.tintColor = Helper.Colors.lightOrange
        tabBar.barTintColor = Helper.Colors.darkBlue
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Helper.Colors.lightGray.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab), image: R.Images.TabBar.icon(for: tab), tag: tab.rawValue)
            
            return controller
        }
        
        setViewControllers(controllers, animated:  false)
    }
    
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .pictureOfDay: return OverviewController()
        case .planets: return SessionController()
        case .images: return ProgressController()
        case .peoples: return SettingsController()
        }
    }
    
}
