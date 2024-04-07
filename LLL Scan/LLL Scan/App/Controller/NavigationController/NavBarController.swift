//
//  NavBarController.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
//        navigationBar.standardAppearance.titleTextAttributes = [
//            .foregroundColor: UIColor.orange,
//            .font: UIFont(name: "Monospase", size: 24)
//        
//        ]
    }
}
