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
        scrollView.scroll.addSubview(horizontalStackViewForTitleAndDate.sView)
        scrollView.scroll.addSubview(pictureOfDayImageView.customImage)
        scrollView.scroll.addSubview(viewForAbout.view)
        
        //Horizontal StackView
        horizontalStackViewForTitleAndDate.sView.addArrangedSubview(pictureOfTheDayTitleLabel.label)
        horizontalStackViewForTitleAndDate.sView.addArrangedSubview(pictureOfTheDayDateLabel.label)
        
        viewForAbout.view.addSubview(titleLabel.label)
        viewForAbout.view.addSubview(explanationLabel.label)
        
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        
        starsView.view.backgroundColor = .clear
        
        configureNavigation()
        configureStackViews()
        configureToolbar()
        configureCustomView()
        addGradientLayer()
        
        
        
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        scrollView.scroll.showsVerticalScrollIndicator = false
        
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
        gradientLayerForView.endPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayerForView.locations = [0.4, 1.0]
        self.view.layer.insertSublayer(gradientLayerForView, at: 0)
    }
    
    //MARK: - StackView
    private func configureStackViews() {
        horizontalStackViewForTitleAndDate.sView.axis = .horizontal
        horizontalStackViewForTitleAndDate.sView.alignment = .center
        horizontalStackViewForTitleAndDate.sView.distribution = .equalSpacing
        
        verticalStackView.sView.alignment = .center
        verticalStackView.sView.axis = .vertical
        verticalStackView.sView.spacing = 20
    }
    
    //MARK: - Toolbar
    private func configureToolbar() {
        customToolbar.view.backgroundColor = Helper.Colors.lightCyan
        separateLineForToolbar.view.backgroundColor = Helper.Colors.lightYellow
    }
    
    //MARK: - Custom View
    private func configureCustomView() {
        viewForAbout.view.layer.borderColor = UIColor.lightGray.cgColor
        viewForAbout.view.layer.borderWidth = 1
        viewForAbout.view.layer.cornerRadius = 30
        viewForAbout.view.clipsToBounds = true
        
    }
        
    
    func makeStars() {
        starsView.view.frame = view.bounds
     
        for _ in 0..<50 {
            let star = UIView()
            star.backgroundColor = Helper.Colors.lightYellow
            star.layer.shadowOffset = .zero
            star.layer.shadowColor = Helper.Colors.milkWhite.cgColor
            star.layer.shadowRadius = 4

            
            let x = CGFloat.random(in: 0..<starsView.view.bounds.width)
            let y = CGFloat.random(in: 0..<starsView.view.bounds.height)
            let intRandom = CGFloat.random(in: 2..<12)
            star.frame = CGRect(x: x, y: y, width: intRandom, height: intRandom)
            star.layer.cornerRadius = star.bounds.width / 2
            
            starsView.view.addSubview(star)
            
            //Animation
            view.layoutIfNeeded()
            UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse]) {
                star.layer.shadowOpacity = 2
                self.view.layoutIfNeeded()
            }
        }
    }
}
