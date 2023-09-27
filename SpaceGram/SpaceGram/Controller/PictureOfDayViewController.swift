//
//  PictureOfDayViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class PictureOfDayViewController: UIViewController {
    
    let dataFetcher = DataFetcher()
    
    let scrollView = CustomScrollView()
    let activityIndicatorViewForPictureOfDay = ActivityIndicatorView()
    let pictureOfTheDayTitleLabel = CustomLabel()
    let pictureOfTheDayDateLabel = CustomLabel()
    let verticalStackView = CustomStackView()
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
        layoutView()
    }
    
    
    
    
    
}
