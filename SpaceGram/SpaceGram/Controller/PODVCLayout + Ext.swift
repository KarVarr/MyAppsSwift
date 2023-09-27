//
//  PODVCLayout + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit


extension PictureOfDayViewController {
    func layoutView() {
        let scrollView = scrollView.scroll
        
        let starsView = starsView.view
        
        let activityIndicatorPicture = activityIndicatorViewForPictureOfDay.indicator
        
        let horizontalStackViewForTitleAndDate = horizontalStackViewForTitleAndDate.sView
//        let pictureOfTheDayTitleLabel = pictureOfTheDayTitleLabel.label
//        let pictureOfTheDayDateLabel = pictureOfTheDayDateLabel.label
        
        let verticalStackView = verticalStackView.sView
        let pictureOfDayImageView = pictureOfDayImageView.customImage
        //        let titleLabel = titleLabel.label
        //        let dateLabel = dateLabel.label
        let explanationLabel = explanationLabel.label
        
        let separateLineForToolbar = separateLineForToolbar.view
        let customToolbar = customToolbar.view
        
        
        NSLayoutConstraint.activate([
            starsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starsView.topAnchor.constraint(equalTo: view.topAnchor),
            starsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: separateLineForToolbar.topAnchor, constant: -3),
            
            horizontalStackViewForTitleAndDate.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            horizontalStackViewForTitleAndDate.topAnchor.constraint(equalTo: scrollView.topAnchor),
            horizontalStackViewForTitleAndDate.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            horizontalStackViewForTitleAndDate.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            verticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: horizontalStackViewForTitleAndDate.bottomAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            activityIndicatorPicture.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            activityIndicatorPicture.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            pictureOfDayImageView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            pictureOfDayImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            pictureOfDayImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            
            //            titleLabel.topAnchor.constraint(equalTo: pictureOfDayImageView.bottomAnchor),
            //            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            //            explanationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            explanationLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 20),
            explanationLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -20),
            
            separateLineForToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separateLineForToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separateLineForToolbar.bottomAnchor.constraint(equalTo: customToolbar.topAnchor),
            separateLineForToolbar.heightAnchor.constraint(equalToConstant: 1.0),
            
            customToolbar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customToolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customToolbar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
        ])
    }
}
