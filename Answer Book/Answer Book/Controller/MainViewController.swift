//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let fetchData = FetchData()
    
    let viewBoxForQuotes = ViewBoxView()
    var quotesLabelForQuote = LabelView()
    var quotesLabelForAuthor = LabelView()
    var quotesLabelOfDayTitle = LabelView()
    var quotesLabelOfDayDate = LabelView()
    let activityIndicatorView = ActivityIndicatorView()
    
    let viewBoxForAnswer = ViewBoxView()
    var answerLabel = LabelView()
    let askButton = ButtonView()
    
    let circleTopCornerQuote = ViewBoxView()
    let circleBottomCornerQuote = ViewBoxView()
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
        addViews()
        getQuotes()
    }
    
    override func viewDidLayoutSubviews() {
        settingsForAskButton()
        settingsForQuotes()
        settingsForAnswer()
        layoutView()
        createCircle(for: circleTopCornerQuote, withColor: UIColor.magenta)
        createCircle(for: circleBottomCornerQuote, withColor: UIColor.cyan)
        createCircle(for: magicBallInside, withColor: UIColor.white)
    }
    
    //MARK: - Functions
    func getDateFromNow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: Date())
    }
    
    @objc func askButtonPressed () {
        viewBoxForAnswer.viewBox.layer.removeAllAnimations()
        
        answerLabel.label.font = Helper.Font.noteworthyLight(with: 22)
        answerLabel.label.text = "..."
        askButton.button.setTitle("...", for: .normal)
        askButton.button.backgroundColor = Helper.Colors.lightYellow
        askButton.button.isEnabled = false
        
        //MARK: Animation
        let animationDuration = 0.1
        
        view.layoutIfNeeded()
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
            self.viewBoxForAnswer.viewBox.transform = CGAffineTransform(translationX: 15, y: 0)
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut, .repeat]) {
                self.viewBoxForAnswer.viewBox.transform = CGAffineTransform(translationX: -15, y: 0)
                self.view.layoutIfNeeded()
            }
        }
        
        view.layoutIfNeeded()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            UIView.animate(withDuration: 0.3) {
                self?.viewBoxForAnswer.viewBox.layer.removeAllAnimations()
                self?.viewBoxForAnswer.viewBox.transform = .identity
                self?.getAnswer()
                self?.askButton.button.isEnabled = true
                self?.askButton.button.backgroundColor = Helper.Colors.yellow
                self?.askButton.button.setTitle("SHAKE AGAIN!", for: .normal)
                self?.view.layoutIfNeeded()
            }
        }
    }
    
    
    //MARK: - Get data
    func getQuotes() {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.fetchData.decodeAPI(at: Helper.URL.quotesUrl) { (quotes: [Quotes]?) in
                DispatchQueue.main.async {
                    quotes?.forEach {
                        self.quotesLabelForQuote.label.text = "\"\($0.q)\""
                        self.quotesLabelForAuthor.label.text = $0.a
                        self.activityIndicatorView.indicator.stopAnimating()
                    }
                }
            }
        }
        
    }
    
    func getAnswer() {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.fetchData.decodeAPI(at: Helper.URL.answerUrl) { (answer: Answer?) in
                DispatchQueue.main.async {
                    self.answerLabel.label.text = answer?.reading
                }
            }
        }
    }
    
}

