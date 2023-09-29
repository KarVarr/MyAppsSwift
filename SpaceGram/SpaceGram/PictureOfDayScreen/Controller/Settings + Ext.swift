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
        
        //Scroll View
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(starsView.view)
        scrollView.scroll.addSubview(activityIndicatorViewForPictureOfDay.indicator)
        scrollView.scroll.addSubview(viewContainerForTitleAndDate.view)
        scrollView.scroll.addSubview(pictureOfDayImageView.customImage)
        scrollView.scroll.addSubview(viewForAbout.view)
        
        //Horizontal StackView
        viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayTitleLabel.label)
        viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayDateLabel.label)
        
        viewForAbout.view.addSubview(titleLabel.label)
        viewForAbout.view.addSubview(explanationLabel.label)
        
        view.addSubview(separateLineForToolbar.view)
        view.addSubview(customToolbar.view)
        customToolbar.view.addSubview(horizontalVStackForToolbar.sView)
    }
    
    func settingView() {
        
        configureNavigation()
        configureViewContainersForTitleAndDate()
        configureStackViews()
        configureToolbar()
        configureCustomView()
        addGradientLayer()
        
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        
        scrollView.scroll.showsVerticalScrollIndicator = false
        
        pictureOfTheDayTitleLabel.label.font = Helper.Font.CopperplateBold(with: 22)
        pictureOfTheDayTitleLabel.label.textColor = Helper.Colors.milkWhite
        pictureOfTheDayDateLabel.label.textColor = Helper.Colors.milkWhite
        pictureOfTheDayDateLabel.label.font = Helper.Font.CopperplateBold(with: 18)
        
    }
    
    //MARK: - View for Title and Date
    private func configureViewContainersForTitleAndDate() {
        viewContainerForTitleAndDate.view.clipsToBounds = true
        viewContainerForTitleAndDate.view.layer.cornerRadius = 30
    }
    
    //MARK: - Custom View for About
    private func configureCustomView() {
        viewForAbout.view.layer.borderColor = UIColor.lightGray.cgColor
        viewForAbout.view.layer.borderWidth = 1
        viewForAbout.view.layer.cornerRadius = 30
        viewForAbout.view.clipsToBounds = true
        
        titleLabel.label.font = Helper.Font.DINCondensedBold(with: 24)
        explanationLabel.label.font = Helper.Font.AppleSDGothicNeoBold(with: 18)
    }
    
    
    
    
}
