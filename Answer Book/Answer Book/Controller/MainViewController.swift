//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let dataFetcher = DataFetcher()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // Views for displaying quotes
    let quoteViewBox = ViewBoxView()
    var quoteLabel = LabelView()
    var authorLabel = LabelView()
    var titleLabel = LabelView()
    var dateLabel = LabelView()
    let activityIndicator = ActivityIndicatorView()
    
    // Views for answering questions
    let answerViewBox = ViewBoxView()
    var answerLabel = LabelView()
    let shakeButton = ButtonView()
    
    let topCornerCircle = ViewBoxView()
    let bottomCornerCircle = ViewBoxView()
    let circleInsideBall = ViewBoxView()
    let magicBallImage = ImageViewView()
    
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        fetchQuotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blurEffect()
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        layoutView()
        createCircle(for: topCornerCircle, withColor: UIColor.magenta)
        createCircle(for: bottomCornerCircle, withColor: UIColor.cyan)
        createCircle(for: circleInsideBall, withColor: UIColor.white)
        
        configureShakeButton()
        configureQuotesViews()
        configureAnswerView()
    }
    
   
    
    
}

