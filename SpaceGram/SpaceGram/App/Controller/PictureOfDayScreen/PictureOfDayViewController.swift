//
//  PictureOfDayViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit
import SkeletonView

class PictureOfDayViewController: BaseController {
    
    let dataFetcher = DataFetcher()
    let imagesForToolbar = ImagesForToolbar()
    
    //Stars on the view
    let starsView = CustomView()
    
    //HorizontalView For Title and Date
    let viewContainerForTitleAndDate = CustomView()
    let pictureOfTheDayTitleLabel = CustomLabel()
    let pictureOfTheDayDateLabel = CustomLabel()
    
    //Picture Of The Day
    var pictureOfDayImageView = CustomImageView()
    
    //Scroll and ViewForAbout. Title and date label.
    let scrollView = CustomScrollView()
    let viewForAbout = CustomView()
    var titleLabel = CustomLabel()
    var dateLabel = CustomLabel()
    var explanationLabel = CustomLabel()
    
    //Toolbar
    let separateLineForToolbar = CustomView()
    let customToolbar = CustomView()
    let horizontalStackForToolbar = CustomStackView()
    let homeImageToolbar = CustomImageView()
    let planetImageToolbar = CustomImageView()
    let albumImageToolbar = CustomImageView()
    let userImageToolbar = CustomImageView()
    
    
    //MARK: - ViewDidLoad ect.
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
