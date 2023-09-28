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
    
    func addImagesToToolbar() {
        for imageName in imagesForToolbar.images {
            let imageView = CustomImageView()
            imageView.customImage.image = UIImage(named: imageName)
            imageView.customImage.contentMode = .scaleAspectFit
            horizontalVStackForToolbar.sView.addArrangedSubview(imageView.customImage)
        }
    }
    
    //MARK: - Navigation
    private func configureNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    //MARK: - Gradient
    private func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = Helper.Colors.blueGradient
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.5)
        viewForAbout.view.layer.insertSublayer(gradientLayer, at: 0)
        
        let gradientLayerForView = CAGradientLayer()
        gradientLayerForView.frame = view.bounds
        gradientLayerForView.colors = Helper.Colors.darkBlueGradient
        gradientLayerForView.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayerForView.locations = [0.2]
        self.view.layer.insertSublayer(gradientLayerForView, at: 0)
        
    }
    
    //MARK: - StackView
    private func configureStackViews() {
        
        addImagesToToolbar()
        
        horizontalVStackForToolbar.sView.axis = .horizontal
        horizontalVStackForToolbar.sView.alignment = .center
        horizontalVStackForToolbar.sView.distribution = .fillEqually
        horizontalVStackForToolbar.sView.spacing = 20
        
    }
    
    private func configureViewContainersForTitleAndDate() {
        viewContainerForTitleAndDate.view.clipsToBounds = true
        viewContainerForTitleAndDate.view.layer.cornerRadius = 30
    }
    
    //MARK: - Toolbar
    private func configureToolbar() {
        customToolbar.view.backgroundColor = Helper.Colors.lightSkyBlue
        separateLineForToolbar.view.backgroundColor = Helper.Colors.lightGray.withAlphaComponent(0.8)
    }
    
    //MARK: - Custom View
    private func configureCustomView() {
        viewForAbout.view.layer.borderColor = UIColor.lightGray.cgColor
        viewForAbout.view.layer.borderWidth = 1
        viewForAbout.view.layer.cornerRadius = 30
        viewForAbout.view.clipsToBounds = true
        
        titleLabel.label.font = Helper.Font.DINCondensedBold(with: 24)
        explanationLabel.label.font = Helper.Font.AppleSDGothicNeoBold(with: 18)
    }
    
    //MARK: - Blur
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gradientLayerForHStack = CAGradientLayer()
        gradientLayerForHStack.frame = view.bounds
        gradientLayerForHStack.colors = Helper.Colors.pinkAndBlueGradient
        gradientLayerForHStack.endPoint = CGPoint(x: 0, y: 0.5)
        
        viewContainerForTitleAndDate.view.addSubview(blurView)
        viewContainerForTitleAndDate.view.layer.insertSublayer(gradientLayerForHStack, at: 0)
    }
    
    func makeStars() {
        starsView.view.backgroundColor = .clear
        starsView.view.frame = view.bounds
        
        for _ in 0..<50 {
            let star = UIView()
            star.backgroundColor = Helper.Colors.lightYellow
            star.layer.shadowOffset = .zero
            star.layer.shadowColor = Helper.Colors.white.cgColor
            star.layer.shadowRadius = 4
            
            
            let x = CGFloat.random(in: 0..<starsView.view.bounds.width)
            let y = CGFloat.random(in: 0..<starsView.view.bounds.height)
            let intRandom = CGFloat.random(in: 2..<12)
            star.frame = CGRect(x: x, y: y, width: intRandom, height: intRandom)
            star.layer.cornerRadius = star.bounds.width / 2
            
            starsView.view.addSubview(star)
            
            //Animation
            view.layoutIfNeeded()
            UIView.animate(withDuration: 6, delay: 0, options: [.repeat, .autoreverse]) {
                star.backgroundColor = Helper.Colors.yellow
                star.layer.shadowOpacity = 3
                self.view.layoutIfNeeded()
            }
        }
    }
}
