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
        
        //Scroll View
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(verticalStackView.sView)
        scrollView.scroll.addSubview(horizontalStackViewForTitleAndDate.sView)
        scrollView.scroll.addSubview(activityIndicatorViewForPictureOfDay.indicator)
        
        //Horizontal StackView
        horizontalStackViewForTitleAndDate.sView.addArrangedSubview(pictureOfTheDayTitleLabel.label)
        horizontalStackViewForTitleAndDate.sView.addArrangedSubview(pictureOfTheDayDateLabel.label)
        
        //Vertical StackView
        verticalStackView.sView.addArrangedSubview(pictureOfDayImageView.customImage)
        verticalStackView.sView.addArrangedSubview(titleLabel.label)
        verticalStackView.sView.addArrangedSubview(dateLabel.label)
        verticalStackView.sView.addArrangedSubview(explanationLabel.label)
        
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        view.backgroundColor = Helper.Colors.darkBlue
        starsView.view.backgroundColor = .clear
        
        configureStackViews()
        configureToolbar()
        
        title = "SpaceGram"
        
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        scrollView.scroll.showsVerticalScrollIndicator = false
    }
    
    private func configureStackViews() {
        
        horizontalStackViewForTitleAndDate.sView.axis = .horizontal
        horizontalStackViewForTitleAndDate.sView.alignment = .center
        horizontalStackViewForTitleAndDate.sView.distribution = .equalSpacing
        
        verticalStackView.sView.alignment = .center
        verticalStackView.sView.axis = .vertical
        verticalStackView.sView.spacing = 20
    }
    
    func configureToolbar() {
        customToolbar.view.backgroundColor = Helper.Colors.lightCyan
        separateLineForToolbar.view.backgroundColor = Helper.Colors.lightYellow
    }
    
    
    func makeStars() {
        starsView.view.frame = view.bounds
        
        for star in starsView.view.subviews {
            star.removeFromSuperview()
        }
        
        for _ in 0..<100 {
            let star = UIView()
            star.backgroundColor = Helper.Colors.lightYellow
            let x = CGFloat.random(in: 0..<starsView.view.bounds.width)
            let y = CGFloat.random(in: 0..<starsView.view.bounds.height)
            let intRandom = CGFloat.random(in: 2..<8)
            star.frame = CGRect(x: x, y: y, width: intRandom, height: intRandom)
            star.layer.cornerRadius = star.bounds.width / 2
            
            starsView.view.addSubview(star)
        }
    }
}
