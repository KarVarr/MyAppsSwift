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
        
        answerLabel.label.font = Helper.Font.noteworthyLight(with: 22)
        answerLabel.label.text = "..."
        askButton.button.setTitle("...", for: .normal)
        askButton.button.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, flags: .barrier) { [weak self] in
            self?.getAnswer()
            self?.askButton.button.isEnabled = true
            self?.askButton.button.setTitle("SHAKE AGAIN!", for: .normal)
        }

    }
    
    
    func getQuotes() {
        fetchData.decodeAPI(at: Helper.URL.quotesUrl) { [unowned self] (quotes: [Quotes]?) in
            DispatchQueue.main.async {
                quotes?.forEach {
                    self.quotesLabelForQuote.label.text = "\"\($0.q)\""
                    self.quotesLabelForAuthor.label.text = $0.a
                    self.activityIndicatorView.indicator.stopAnimating()
                }
            }
        }
    }
    
    func getAnswer() {
        fetchData.decodeAPI(at: Helper.URL.answerUrl) { [unowned self] (answer: Answer?) in
            DispatchQueue.main.async {
                self.answerLabel.label.text = answer?.reading
            }
        }
    }
    
}

