//
//  Settings + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit

extension PictureOfDayViewController {
    func addSubviews() {
        view.addSubview(starsView.view)
        //Horizontal StackView
        
        view.addSubview(viewContainerForTitleAndDate.view)
        viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayTitleLabel.label)
        viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayDateLabel.label)
        
        view.addSubview(pictureOfDayImageView.customImage)
        
        //Scroll View
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(activityIndicatorViewForPictureOfDay.indicator)
        scrollView.scroll.addSubview(viewForAbout.view)
        
        viewForAbout.view.addSubview(titleLabel.label)
        viewForAbout.view.addSubview(explanationLabel.label)
        
        
        view.addSubview(separateLineForToolbar.view)
        view.addSubview(customToolbar.view)
        customToolbar.view.addSubview(horizontalVStackForToolbar.sView)
    }
    
    func settingView() {
        scrollView.scroll.delegate = self
        
        configureCustomView()
        configureNavigation()
        configureViewContainersForTitleAndDate()
        configureStackViews()
        configureToolbar()
        addGradientLayer()
        
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        
        scrollView.scroll.showsVerticalScrollIndicator = false
    }
    
    //MARK: - View for Title and Date
    private func configureViewContainersForTitleAndDate() {
        viewContainerForTitleAndDate.view.clipsToBounds = true
        viewContainerForTitleAndDate.view.layer.cornerRadius = 30
        
        pictureOfTheDayTitleLabel.label.font = Helper.Font.CopperplateBold(with: 22)
        pictureOfTheDayTitleLabel.label.textColor = Helper.Colors.milkWhite
        pictureOfTheDayDateLabel.label.textColor = Helper.Colors.milkWhite
        pictureOfTheDayDateLabel.label.font = Helper.Font.CopperplateBold(with: 18)
    }
    
    //MARK: - Custom View for About
    private func configureCustomView() {
        titleLabel.label.font = Helper.Font.DINCondensedBold(with: 36)
        titleLabel.label.textAlignment = .center
        explanationLabel.label.font = Helper.Font.AppleSDGothicNeoBold(with: 22)
        explanationLabel.label.textAlignment = .center
        
    }
    
    
    
    
}
