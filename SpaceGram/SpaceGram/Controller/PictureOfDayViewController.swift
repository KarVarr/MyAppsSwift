//
//  PictureOfDayViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class PictureOfDayViewController: UIViewController {
    
    let dataFetcher = DataFetcher()
    //Make stars on the view
    let starsView = CustomView()
    
    
    let scrollView = CustomScrollView()
    let activityIndicatorViewForPictureOfDay = ActivityIndicatorView()
    
    let horizontalStackViewForTitleAndDate = CustomStackView()
    
    let verticalStackView = CustomStackView()
    let pictureOfTheDayTitleLabel = CustomLabel()
    let pictureOfTheDayDateLabel = CustomLabel()
    var pictureOfDayImageView = CustomImageView()
    var titleLabel = CustomLabel()
    var dateLabel = CustomLabel()
    var explanationLabel = CustomLabel()
    
    let separateLineForToolbar = CustomView()
    let customToolbar = CustomView()
    
    let urlNasa = "https://api.nasa.gov/planetary/apod?api_key=kOZ9oe3uvIOL9jm2Jjqzesdkl6cp48PWhpsNZLeM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        settingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPictureOfTheDay()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Set the frame of the starsView to match the view's bounds
        starsView.view.frame = view.bounds
        
        // Remove any existing stars
        for star in starsView.view.subviews {
            star.removeFromSuperview()
        }

        // Add stars to the starsView
        for _ in 0..<100 {
            let star = UIView()
            star.backgroundColor = .white
            let x = CGFloat.random(in: 0..<starsView.view.bounds.width)
            let y = CGFloat.random(in: 0..<starsView.view.bounds.height)
            let intRandom = CGFloat.random(in: 2..<8)
            star.frame = CGRect(x: x, y: y, width: intRandom, height: intRandom)
            star.layer.cornerRadius = star.bounds.width / 2
            
            starsView.view.addSubview(star)
        }
        
        // Continue with your other layout setup
        layoutView()
    }
    
    
    
    
    
}
