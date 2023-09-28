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
        
        let viewContainerForHStack = viewContainerForTitleAndDate.view
        let pictureOfTheDayTitleLabel = pictureOfTheDayTitleLabel.label
        let pictureOfTheDayDateLabel = pictureOfTheDayDateLabel.label
        let pictureOfDayImageView = pictureOfDayImageView.customImage
        
        let viewForAbout = viewForAbout.view
        let titleLabel = titleLabel.label

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
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: separateLineForToolbar.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            viewContainerForHStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            viewContainerForHStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewContainerForHStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            viewContainerForHStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            viewContainerForHStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            pictureOfTheDayTitleLabel.centerYAnchor.constraint(equalTo: viewContainerForHStack.centerYAnchor),
            pictureOfTheDayTitleLabel.leadingAnchor.constraint(equalTo: viewContainerForHStack.leadingAnchor, constant: 10),
            
            pictureOfTheDayDateLabel.centerYAnchor.constraint(equalTo: viewContainerForHStack.centerYAnchor),
            pictureOfTheDayDateLabel.trailingAnchor.constraint(equalTo: viewContainerForHStack.trailingAnchor, constant: -10),
            
            activityIndicatorPicture.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            activityIndicatorPicture.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            pictureOfDayImageView.topAnchor.constraint(equalTo: viewContainerForHStack.bottomAnchor, constant: 20),
            pictureOfDayImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            pictureOfDayImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            pictureOfDayImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3),

            viewForAbout.topAnchor.constraint(equalTo: pictureOfDayImageView.bottomAnchor, constant: 20),
            viewForAbout.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            viewForAbout.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            viewForAbout.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewForAbout.heightAnchor.constraint(equalTo: explanationLabel.heightAnchor, multiplier: 1.2),
            
            titleLabel.topAnchor.constraint(equalTo: viewForAbout.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: viewForAbout.centerXAnchor),
            
            explanationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            explanationLabel.leadingAnchor.constraint(equalTo: viewForAbout.leadingAnchor, constant: 10),
            explanationLabel.trailingAnchor.constraint(equalTo: viewForAbout.trailingAnchor, constant: -10),
            explanationLabel.centerXAnchor.constraint(equalTo: viewForAbout.centerXAnchor),
            
            separateLineForToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separateLineForToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separateLineForToolbar.bottomAnchor.constraint(equalTo: customToolbar.topAnchor),
            separateLineForToolbar.heightAnchor.constraint(equalToConstant: 0.4),
            
            customToolbar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customToolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customToolbar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
        ])
    }
}
