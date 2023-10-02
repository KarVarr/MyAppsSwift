//
//  SettingsHD + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit


extension HDPictureViewController {
    
    override func settingView() {
        configureNavigation()
        configureImage()
        configureScrollView()
        addGradientLayer()
    }
    
    private func configureNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionPressed))
    }

    private func configureImage() {
        hdPictureOfDay.customImage.contentMode = .scaleAspectFit
//        hdPictureOfDay.customImage.enableZoomRotationPan()
    }
    
  
    
    @objc func actionPressed() {
        
    }
    
}
