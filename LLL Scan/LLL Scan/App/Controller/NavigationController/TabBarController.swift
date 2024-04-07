//
//  TabBarController.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit
enum Tabs: Int, CaseIterable {
    case scan
    case files
}
final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        switchTo(tab: .scan)
        
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    final func configureAppearance() {
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
        
        
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            
            controller.tabBarItem = UITabBarItem(
                title: Helper.Strings.TabBar.title(for: tab),
                image: Helper.Images.TabBar.icon(for: tab),
                tag: tab.rawValue
            )
            controller.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            return controller
        }
        setViewControllers(controllers, animated: true)
    }
    
    private func getController(for tab: Tabs) -> BaseViewController {
           switch tab {
           case .scan: return ScanVC()
           case .files: return FilesVC()
           }
       }
}
