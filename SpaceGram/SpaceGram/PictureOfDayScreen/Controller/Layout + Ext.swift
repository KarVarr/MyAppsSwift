//
//  Layout + Ext.swift
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
        
        let viewContainerForTitleAndDate = viewContainerForTitleAndDate.view
        let pictureOfTheDayTitleLabel = pictureOfTheDayTitleLabel.label
        let pictureOfTheDayDateLabel = pictureOfTheDayDateLabel.label
        let pictureOfDayImageView = pictureOfDayImageView.customImage
        
        let viewForAbout = viewForAbout.view
        let titleLabel = titleLabel.label

        let explanationLabel = explanationLabel.label
        
        let separateLineForToolbar = separateLineForToolbar.view
        let customToolbar = customToolbar.view
        let horizontalVStackForToolbar = horizontalVStackForToolbar.sView
        
        
        //MARK: - Scroll view and activity indicator
        NSLayoutConstraint.activate([
            starsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starsView.topAnchor.constraint(equalTo: view.topAnchor),
            starsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: pictureOfDayImageView.bottomAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            activityIndicatorPicture.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            activityIndicatorPicture.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
        ])
        
        //MARK: - ViewContainer for Title and Date
        NSLayoutConstraint.activate([
            viewContainerForTitleAndDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewContainerForTitleAndDate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewContainerForTitleAndDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            viewContainerForTitleAndDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            viewContainerForTitleAndDate.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            pictureOfTheDayTitleLabel.centerYAnchor.constraint(equalTo: viewContainerForTitleAndDate.centerYAnchor),
            pictureOfTheDayTitleLabel.leadingAnchor.constraint(equalTo: viewContainerForTitleAndDate.leadingAnchor, constant: 10),
            
            pictureOfTheDayDateLabel.centerYAnchor.constraint(equalTo: viewContainerForTitleAndDate.centerYAnchor),
            pictureOfTheDayDateLabel.trailingAnchor.constraint(equalTo: viewContainerForTitleAndDate.trailingAnchor, constant: -10),
            
        ])
        
        //MARK: - Picture of Day, Title and Explanation
        NSLayoutConstraint.activate([
            pictureOfDayImageView.topAnchor.constraint(equalTo: viewContainerForTitleAndDate.bottomAnchor, constant: 20),
            pictureOfDayImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pictureOfDayImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pictureOfDayImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            viewForAbout.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewForAbout.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForAbout.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForAbout.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewForAbout.heightAnchor.constraint(equalTo: explanationLabel.heightAnchor, multiplier: 1.2),

            titleLabel.topAnchor.constraint(equalTo: viewForAbout.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            explanationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            explanationLabel.leadingAnchor.constraint(equalTo: viewForAbout.leadingAnchor, constant: 10),
            explanationLabel.trailingAnchor.constraint(equalTo: viewForAbout.trailingAnchor, constant: -10),

        ])
        
        
        //MARK: - Toolbar
        NSLayoutConstraint.activate([
            separateLineForToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separateLineForToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separateLineForToolbar.bottomAnchor.constraint(equalTo: customToolbar.topAnchor),
            separateLineForToolbar.heightAnchor.constraint(equalToConstant: 0.4),
            
            customToolbar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customToolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customToolbar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            horizontalVStackForToolbar.topAnchor.constraint(equalTo: customToolbar.topAnchor, constant: 15),
            horizontalVStackForToolbar.leadingAnchor.constraint(equalTo: customToolbar.leadingAnchor, constant: 15),
            horizontalVStackForToolbar.trailingAnchor.constraint(equalTo: customToolbar.trailingAnchor, constant: -15),
            horizontalVStackForToolbar.bottomAnchor.constraint(equalTo: customToolbar.bottomAnchor, constant: -30),
        ])
    }
}