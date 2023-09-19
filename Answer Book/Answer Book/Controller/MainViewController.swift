//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let dataFetcher = DataFetcher()
    
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
    let magicBallInside = ViewBoxView()
    let magicBallImage = ImageViewView()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blurEffect()
        addSubviews()
        fetchQuotes()
    }
    
    override func viewDidLayoutSubviews() {
        layoutView()
        createCircle(for: topCornerCircle, withColor: UIColor.magenta)
        createCircle(for: bottomCornerCircle, withColor: UIColor.cyan)
        createCircle(for: magicBallInside, withColor: UIColor.white)
        
        configureShakeButton()
        configureQuotesViews()
        configureAnswerView()
        
    }
    
    //MARK: - Functions
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: Date())
    }
    
    @objc func shakeButtonPressed () {
        // Reset animation
        answerViewBox.viewBox.layer.removeAllAnimations()
        
        // Update UI for shaking
        answerLabel.label.font = Helper.Font.noteworthyLight(with: 22)
        answerLabel.label.text = "..."
        shakeButton.button.setTitle("...", for: .normal)
        shakeButton.button.backgroundColor = Helper.Colors.lightYellow
        shakeButton.button.isEnabled = false
        
        // Animate shaking
        let animationDuration = 0.1
        view.layoutIfNeeded()
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
            self.answerViewBox.viewBox.transform = CGAffineTransform(translationX: 15, y: 0)
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut, .repeat]) {
                self.answerViewBox.viewBox.transform = CGAffineTransform(translationX: -15, y: 0)
                self.view.layoutIfNeeded()
            }
        }
        
        view.layoutIfNeeded()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self?.fetchAnswer(completion: {
                    self?.answerViewBox.viewBox.layer.removeAllAnimations()
                    self?.answerViewBox.viewBox.transform = .identity
                    self?.shakeButton.button.isEnabled = true
                    self?.shakeButton.button.backgroundColor = Helper.Colors.yellow
                    self?.shakeButton.button.setTitle("SHAKE AGAIN!", for: .normal)
                    self?.view.layoutIfNeeded()
                })
            }
        }
    }
    
    
    //MARK: - Get data
    func fetchQuotes() {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.dataFetcher.decodeAPI(at: Helper.URL.quotesUrl) { (quotes: [Quotes]?) in
                DispatchQueue.main.async {
                    quotes?.forEach {
                        self.quoteLabel.label.text = "\"\($0.q)\""
                        self.authorLabel.label.text = $0.a
                        self.activityIndicator.indicator.stopAnimating()
                    }
                }
            }
        }
        
    }
    
    func fetchAnswer(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.dataFetcher.decodeAPI(at: Helper.URL.answerUrl) { (answer: Answer?) in
                DispatchQueue.main.async {
                    self.answerLabel.label.text = answer?.reading
                    
                    completion()
                }
            }
        }
    }
    
}

