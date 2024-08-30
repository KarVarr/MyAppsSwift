//
//  AboutViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 28.05.2023.
//

import UIKit


class AboutViewController: UIViewController {
    let verticalStackViewForText = CustomStackView()
    let horizontalStackViewForButtons = CustomStackView()
    
    let titleLabel = CustomLabelView()
    let aboutTitleLabel = CustomLabelView()
    let aboutTextLabel = CustomLabelView()
    
    let rateAppButton = CustomButtonView()
    let reportAProblemButton = CustomButtonView()
    let closeModuleButton = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewsSVC()
        configureViewSVC()
        layoutViewSVC()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureLabelsSVC()
        configureStackViewSVC()
        configureButtonsSVC()
    }

    @objc func closeModule() {
        dismiss(animated: true)
    }
}
