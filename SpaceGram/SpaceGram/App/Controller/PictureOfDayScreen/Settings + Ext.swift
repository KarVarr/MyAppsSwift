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
        
        /* Horizontal StackView */
        view.addSubview(viewContainerForTitleAndDate.view)
        viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayTitleLabel.label)
        viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayDateLabel.label)
        
        view.addSubview(pictureOfDayImageView.customImage)
        
        /* Scroll View */
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(viewForAbout.view)
        
        viewForAbout.view.addSubview(titleLabel.label)
        viewForAbout.view.addSubview(explanationLabel.label)
        
        /* Toolbar */
        view.addSubview(separateLineForToolbar.view)
        view.addSubview(customToolbar.view)
        customToolbar.view.addSubview(horizontalStackForToolbar.sView)
    }
    
    func settingView() {
        configureViewContainersForTitleAndDate()
        configurePictureOfDayImageView()
        configureCustomView()
        configureNavigation()
        configureStackViews()
        configureToolbar()
        addGradientLayer()
        showSkeleton()
    }
    
    //MARK: - View for Title and Date
    private func configureViewContainersForTitleAndDate() {
        viewContainerForTitleAndDate.view.isSkeletonable = true
        viewContainerForTitleAndDate.view.clipsToBounds = true
        viewContainerForTitleAndDate.view.layer.cornerRadius = 30
        viewContainerForTitleAndDate.view.layer.borderWidth = 0.5
        viewContainerForTitleAndDate.view.layer.borderColor = Helper.Colors.lightGray.cgColor

        
        
        pictureOfTheDayTitleLabel.label.font = Helper.Font.CopperplateBold(with: 22)
        pictureOfTheDayTitleLabel.label.textColor = Helper.Colors.milkWhite
        pictureOfTheDayDateLabel.label.textColor = Helper.Colors.milkWhite
        pictureOfTheDayDateLabel.label.font = Helper.Font.CopperplateBold(with: 18)
    }
    
    private func configurePictureOfDayImageView() {
        pictureOfDayImageView.customImage.isSkeletonable = true
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        pictureOfDayImageView.customImage.layer.borderWidth = 0.5
        pictureOfDayImageView.customImage.layer.borderColor = Helper.Colors.lightGray.cgColor
    }
    
    //MARK: - ScrollView and ViewForAbout. Title and Explanation labels
    private func configureCustomView() {
        scrollView.scroll.delegate = self
        scrollView.scroll.showsVerticalScrollIndicator = false
        scrollView.scroll.isSkeletonable = true
        scrollView.scroll.clipsToBounds = true
        scrollView.scroll.layer.cornerRadius = 30
        
        titleLabel.label.font = Helper.Font.DINCondensedBold(with: 36)
        titleLabel.label.textAlignment = .center
        explanationLabel.label.font = Helper.Font.AppleSDGothicNeoBold(with: 20)
        explanationLabel.label.textAlignment = .center
        
    }
    
    //MARK: - Skeleton
    private func showSkeleton() {
        let arrayOfElementsForSkeleton = [viewContainerForTitleAndDate.view, pictureOfDayImageView.customImage, scrollView.scroll]
        
        arrayOfElementsForSkeleton.forEach {
            $0.showGradientSkeleton(usingGradient: .init(baseColor: Helper.Colors.darkMagenta),animated: true, delay: 0)
        }
    }
    
    func hideSkeleton() {
        let arrayOfElementsForSkeleton = [viewContainerForTitleAndDate.view, pictureOfDayImageView.customImage, scrollView.scroll]
        
        arrayOfElementsForSkeleton.forEach {
            $0.hideSkeleton()
        }
    }
}
