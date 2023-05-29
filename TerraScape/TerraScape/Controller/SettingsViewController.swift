//
//  SettingsViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 28.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    let verticalStackViewForText = CustomStackView()
    let horizontalStackViewForButtons = CustomStackView()
    
    let titleLabel = CustomLabelView()
    let aboutTitleLabel = CustomLabelView()
    let aboutTextLabel = CustomLabelView()
    
    let rateAppButton = CustomButtonView()
    let reportAProblemButton = CustomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        settings()
        labelsSetting()
        stackViewSetting()
        buttonsSetting()
        layout()
    }
    
    
    func addViews() {
        view.addSubview(verticalStackViewForText.customStackView)
        verticalStackViewForText.customStackView.addArrangedSubview(titleLabel.customLabel)
        verticalStackViewForText.customStackView.addArrangedSubview(aboutTitleLabel.customLabel)
        verticalStackViewForText.customStackView.addArrangedSubview(aboutTextLabel.customLabel)
        
        view.addSubview(horizontalStackViewForButtons.customStackView)
        horizontalStackViewForButtons.customStackView.addArrangedSubview(rateAppButton.customButton)
        horizontalStackViewForButtons.customStackView.addArrangedSubview(reportAProblemButton.customButton)
        
    }
    
    func settings() {
        view.backgroundColor = Helpers.Colors.settingsViewBackground
        
    }
    
    func labelsSetting() {
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
    
    func stackViewSetting() {
        verticalStackViewForText.customStackView.axis = .vertical
        verticalStackViewForText.customStackView.alignment = .center
        verticalStackViewForText.customStackView.spacing = 20.0
        
        horizontalStackViewForButtons.customStackView.axis = .horizontal
        horizontalStackViewForButtons.customStackView.distribution = .fillEqually
        horizontalStackViewForButtons.customStackView.spacing = 40.0
        horizontalStackViewForButtons.customStackView.alignment = .center
        
    }
    
    func buttonsSetting() {
        let buttons: [UIButton] = [rateAppButton.customButton, reportAProblemButton.customButton]
        
        for button in buttons {
            button.tintColor = .black
            button.backgroundColor = .white
            button.layer.cornerRadius = Helpers.Radius.cornerRadius
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.3
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
        }
        
        rateAppButton.customButton.setTitle("Rate", for: .normal)
        reportAProblemButton.customButton.setTitle("Report", for: .normal)
        
    }
    
    func layout() {
        let verticalStackViewForText = verticalStackViewForText.customStackView
        let horizontalStackViewForButtons = horizontalStackViewForButtons.customStackView
        let rateAppButton = rateAppButton.customButton
        let reportAProblemButton = reportAProblemButton.customButton
        
        NSLayoutConstraint.activate([
            verticalStackViewForText.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            verticalStackViewForText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalStackViewForText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            verticalStackViewForText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            horizontalStackViewForButtons.topAnchor.constraint(equalTo: verticalStackViewForText.bottomAnchor, constant: 40),
            horizontalStackViewForButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            horizontalStackViewForButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            horizontalStackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            reportAProblemButton.widthAnchor.constraint(lessThanOrEqualToConstant: 30),
            reportAProblemButton.heightAnchor.constraint(equalToConstant: 44),

            rateAppButton.widthAnchor.constraint(lessThanOrEqualToConstant: 30),
            rateAppButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
    }
    
    
    
    
    
    
}
