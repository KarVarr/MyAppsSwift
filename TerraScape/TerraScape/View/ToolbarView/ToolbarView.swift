//
//  ToolbarView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 22.05.2023.
//

import UIKit

class ToolbarView: UIView {
    
    let label = ToolbarLabel()
    let settingButton = CustomButtonView()
    let playButton = CustomButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        settings()
        buttonsSetting()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews() {
        addSubview(label.toolbarLabel.customLabel)
        addSubview(settingButton.customButton)
        addSubview(playButton.customButton)
    }
    
    func settings() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.cornerRadius = 35
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4

    }
    
    func buttonsSetting() {
        playButton.customButton.setImage(UIImage(named: "play")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
        
        
        settingButton.customButton.setImage(UIImage(named: "gear")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    func layout() {
        let label = label.toolbarLabel.customLabel
        let playButton = playButton.customButton
        let settingButton = settingButton.customButton
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(greaterThanOrEqualTo: label.widthAnchor),
            
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 40),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            
            settingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            settingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingButton.widthAnchor.constraint(equalToConstant: 40),
            settingButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
    
}
