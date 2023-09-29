//
//  PictureOfDayViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class PictureOfDayViewController: UIViewController {
    
    let dataFetcher = DataFetcher()
    let imagesForToolbar = ImagesForToolbar()
    
    //Stars on the view
    let starsView = CustomView()
    
    //Scroll and activityIndicator
    let scrollView = CustomScrollView()
    let activityIndicatorViewForPictureOfDay = ActivityIndicatorView()

    let viewContainerForTitleAndDate = CustomView()
    
    let pictureOfTheDayTitleLabel = CustomLabel()
    let pictureOfTheDayDateLabel = CustomLabel()
    var pictureOfDayImageView = CustomImageView()

    let viewForAbout = CustomView()
    var titleLabel = CustomLabel()
    var dateLabel = CustomLabel()
    var explanationLabel = CustomLabel()
    
    //Toolbar
    let separateLineForToolbar = CustomView()
    let customToolbar = CustomView()
    let horizontalVStackForToolbar = CustomStackView()
    let homeImageToolbar = CustomImageView()
    let planetImageToolbar = CustomImageView()
    let albumImageToolbar = CustomImageView()
    let userImageToolbar = CustomImageView()
    
    
    var currentScale: CGFloat = 1.0
    var currentAngle: CGFloat = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffect()
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
