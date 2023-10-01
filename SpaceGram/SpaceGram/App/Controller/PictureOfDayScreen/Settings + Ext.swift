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
        addGradientLayer()
        showSkeleton()
    }

    //MARK: - Picture Of The Date ImageView
    private func configurePictureOfDayImageView() {
        pictureOfDayImageView.customImage.isSkeletonable = true
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        pictureOfDayImageView.customImage.layer.borderWidth = 1
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
        let arrayOfElementsForSkeleton = [pictureOfDayImageView.customImage, scrollView.scroll]
        
        arrayOfElementsForSkeleton.forEach {
            $0.showGradientSkeleton(usingGradient: .init(baseColor: Helper.Colors.darkMagenta),animated: true, delay: 0)
        }
    }
    
    func hideSkeleton() {
        let arrayOfElementsForSkeleton = [pictureOfDayImageView.customImage, scrollView.scroll]
        
        arrayOfElementsForSkeleton.forEach {
            $0.hideSkeleton()
        }
    }
}
