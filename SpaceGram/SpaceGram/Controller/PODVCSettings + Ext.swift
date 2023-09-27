//
//  PODVCSettings + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import Foundation

extension PictureOfDayViewController {
    func addSubviews() {
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(verticalStackView.sView)
        scrollView.scroll.addSubview(activityIndicatorViewForPictureOfDay.indicator)
        
        verticalStackView.sView.addArrangedSubview(pictureOfDayImageView.customImage)
        verticalStackView.sView.addArrangedSubview(titleLabel.label)
        verticalStackView.sView.addArrangedSubview(dateLabel.label)
        verticalStackView.sView.addArrangedSubview(explanationLabel.label)
        
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        view.backgroundColor = .white
//        title = "SpaceGram"
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        customToolbar.view.backgroundColor = .blue
        separateLineForToolbar.view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
//        pictureOfDayImageView.customImage.layer.shadowOpacity = 0.5
        scrollView.scroll.showsVerticalScrollIndicator = false
        verticalStackView.sView.alignment = .center
        verticalStackView.sView.axis = .vertical
        verticalStackView.sView.spacing = 20
        
        
        titleLabel.label.text = ""
        dateLabel.label.text = ""
        explanationLabel.label.text = ""
    }
}
