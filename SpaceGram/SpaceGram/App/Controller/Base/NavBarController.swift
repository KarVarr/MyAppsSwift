//
//  NavBarController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 29.09.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Helper.Colors.lightOrange,
            .font: Helper.Font.Copperplate(with: 20),
        ]
    }
}
