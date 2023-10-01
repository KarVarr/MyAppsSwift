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
        
//        tabBar.layer.borderColor = Helper.Colors.lightGray.cgColor
//        tabBar.layer.borderWidth = 1
//        tabBar.layer.masksToBounds = true
        
//        let picture = PictureOfDayViewController()
//        let planets = PlanetViewController()
//        let images = ImagesViewController()
//        let people = PeopleViewController()
//        
//        
//        let pictureNav = UINavigationController(rootViewController: picture)
//        let planetsNav =  UINavigationController(rootViewController: planets)
//        let imagesNav =  UINavigationController(rootViewController: images)
//        let peopleNav =  UINavigationController(rootViewController: people)
//        
//        
//        setViewControllers([
//            pictureNav,
//            planetsNav,
//            imagesNav,
//            peopleNav
//        ], animated: false)
        
        
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))

            controller.tabBarItem = UITabBarItem(
                title: Helper.Strings.TabBar.title(for: tab),
                image: Helper.Images.TabBar.icon(for: tab),
                tag: tab.rawValue
            )
            
            
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

//extension UIImage {
//    func resized(to newSize: CGSize) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
//        defer { UIGraphicsEndImageContext() }
//        draw(in: CGRect(origin: .zero, size: newSize))
//        return UIGraphicsGetImageFromCurrentImageContext()
//    }
//}
