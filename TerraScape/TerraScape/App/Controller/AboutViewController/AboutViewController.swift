//
//  AboutViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 28.05.2023.
//

import UIKit


class AboutViewController: UIViewController {
    let vStackTitleAndAboutLabels = CustomStackView()
    let vStackImageAndTitle = CustomStackView()
    let vStackButtons = CustomStackView()
    
    let nameView = CustomLabelView()
    
    let aboutImageView = CustomImageView()
    let aboutTitleLabel = CustomLabelView()
    let aboutVersionLabels = CustomLabelView()
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
        configureImageView()
    }

    @objc func closeModule() {
        dismiss(animated: true)
    }
}
