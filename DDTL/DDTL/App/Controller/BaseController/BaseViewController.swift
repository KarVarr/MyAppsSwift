//
//  BaseViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 31.10.2023.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureView()
    }
    
    override func viewWillLayoutSubviews() {
        layoutView()
    }
    
}

@objc extension BaseViewController {
    func addViews() {}
    func configureView() {}
    func layoutView() {}
}

extension BaseViewController {
    func setNavTitle(title: Tabs) {
        navigationItem.title = Helper.Strings.NavTitle.title(for: title)
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: Helper.Colors.darkBlue, .font: Helper.Fonts.BungeeShadeRegular(with: 24)]
        
        switch title {
        case .myListViewController:
            appearance.backgroundColor = Helper.Colors.mainColorFromIcon
        case .worldListViewController:
            appearance.backgroundColor = Helper.Colors.beige
        }
        
        navigationController?.navigationBar.tintColor = Helper.Colors.mainColorFromIcon
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
