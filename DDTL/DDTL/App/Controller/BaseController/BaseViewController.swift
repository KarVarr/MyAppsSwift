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
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Helper.Colors.mainColorFromIcon
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: Helper.Fonts.ChalkboardSERegular(with: 24)]
        
        navigationController?.navigationBar.tintColor = Helper.Colors.mainColorFromIcon
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
