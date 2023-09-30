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
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Helper.Colors.darkMagenta,
            .font: Helper.Font.AppleSDGothicNeoBold(with: 17),
        ]

       
    }
    
    
    
}
