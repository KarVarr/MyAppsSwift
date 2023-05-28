//
//  SettingsViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 28.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    let titleLabel = CustomLabelView()
    let aboutTitleLabel = CustomLabelView()
    let aboutTextLabel = CustomLabelView()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        addViews()
        settings()
        layout()
    }
    
    func addViews() {
        view.addSubview(titleLabel.customLabel)
        view.addSubview(aboutTitleLabel.customLabel)
        view.addSubview(aboutTextLabel.customLabel)
    }
    
    func settings() {
        view.backgroundColor = Helpers.Colors.settingsViewBackground
        
        titleLabel.customLabel.text = Helpers.Strings.settingsTitle
        titleLabel.customLabel.font = UIFont(name: "Thonburi", size: 18)
        
        aboutTitleLabel.customLabel.text = Helpers.Strings.settingsAboutTitleLabel
        aboutTitleLabel.customLabel.textColor = .white
        aboutTitleLabel.customLabel.font = UIFont(name: "GillSans-Bold", size: 32)
        
        aboutTextLabel.customLabel.text = Helpers.Strings.settingsAboutText
        aboutTextLabel.customLabel.textAlignment = .center
        aboutTextLabel.customLabel.numberOfLines = 0
        aboutTextLabel.customLabel.textColor = .white
        aboutTextLabel.customLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    }
    
    func layout() {
        let title = titleLabel.customLabel
        let aboutTitle = aboutTitleLabel.customLabel
        let aboutText = aboutTextLabel.customLabel
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            aboutTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            
            aboutText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutText.topAnchor.constraint(equalTo: aboutTitle.bottomAnchor, constant: 30),
            aboutText.widthAnchor.constraint(equalToConstant: view.frame.size.width - 30),
            
        ])
    }
    

  

}
