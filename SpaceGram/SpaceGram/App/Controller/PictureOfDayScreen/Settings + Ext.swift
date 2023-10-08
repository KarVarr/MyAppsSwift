//
//  Settings + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit

extension PictureOfDayViewController {
    override func settingView() {
        setNavTitle(title: .pictureOfDay)
        
        configurePictureOfDayImageView()
        configureCustomView()
        configureRefresh()
        addGradientLayer()
        showSkeleton()
    }
}
