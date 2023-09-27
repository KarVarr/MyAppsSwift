//
//  PODVCSettings + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit

extension PictureOfDayViewController {
    func addSubviews() {
        
        view.addSubview(starsView.view)
        
        
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(verticalStackView.sView)
        scrollView.scroll.addSubview(horizontalStackViewForTitleAndDate.sView)
        scrollView.scroll.addSubview(activityIndicatorViewForPictureOfDay.indicator)
        
        horizontalStackViewForTitleAndDate.sView.addArrangedSubview(pictureOfTheDayTitleLabel.label)
        horizontalStackViewForTitleAndDate.sView.addArrangedSubview(pictureOfTheDayDateLabel.label)
        
        verticalStackView.sView.addArrangedSubview(pictureOfDayImageView.customImage)
        verticalStackView.sView.addArrangedSubview(titleLabel.label)
        verticalStackView.sView.addArrangedSubview(dateLabel.label)
        verticalStackView.sView.addArrangedSubview(explanationLabel.label)
        
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        view.backgroundColor = .blue
        starsView.view.backgroundColor = .clear
        
        //        title = "SpaceGram"
        //        navigationController?.navigationBar.prefersLargeTitles = true
        
        horizontalStackViewForTitleAndDate.sView.axis = .horizontal
        horizontalStackViewForTitleAndDate.sView.alignment = .center
        horizontalStackViewForTitleAndDate.sView.distribution = .equalSpacing
        horizontalStackViewForTitleAndDate.sView.layer.borderWidth = 2
        
        
        
        customToolbar.view.backgroundColor = .purple
        separateLineForToolbar.view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        scrollView.scroll.showsVerticalScrollIndicator = false
        verticalStackView.sView.alignment = .center
        verticalStackView.sView.axis = .vertical
        verticalStackView.sView.spacing = 20
        
    }
}
