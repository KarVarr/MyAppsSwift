//
//  PictureOfDayViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class PictureOfDayViewController: UIViewController {
    
    let dataFetcher = DataFetcher()
    
    //Stars on the view
    let starsView = CustomView()
    
    //Scroll and activityIndicator
    let scrollView = CustomScrollView()
    let activityIndicatorViewForPictureOfDay = ActivityIndicatorView()
    
    //StackView
    let horizontalStackViewForTitleAndDate = CustomStackView()
    let verticalStackView = CustomStackView()
    
    let pictureOfTheDayTitleLabel = CustomLabel()
    let pictureOfTheDayDateLabel = CustomLabel()
    var pictureOfDayImageView = CustomImageView()
    var titleLabel = CustomLabel()
    var dateLabel = CustomLabel()
    var explanationLabel = CustomLabel()
    
    //Toolbar
    let separateLineForToolbar = CustomView()
    let customToolbar = CustomView()
    
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
        makeStars()
        layoutView()
    }
    
}
