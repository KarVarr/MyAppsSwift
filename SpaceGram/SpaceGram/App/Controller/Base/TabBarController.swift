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
        switchTo(tab: .pictureOfDay)
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configureAppearance() {
        tabBar.tintColor = Helper.Colors.lightOrange
        tabBar.unselectedItemTintColor = Helper.Colors.darkBlue
        tabBar.backgroundColor = Helper.Colors.lightSkyBlue
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            
            controller.tabBarItem = UITabBarItem(
                title: nil,
                image: Helper.Images.TabBar.icon(for: tab),
                tag: tab.rawValue
            )
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -12, right: 0)
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .pictureOfDay: return PictureOfDayViewController()
        case .planets: return PlanetViewController()
        case .images: return ImagesViewController()
        case .peoples: return PeopleViewController()
        }
    }
}

