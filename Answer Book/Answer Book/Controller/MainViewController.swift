//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let viewBoxForQuotes = ViewBoxView()
    let askButton = ButtonView()
    var answerLabel = LabelView()
    var quotesLabelForQuote = LabelView()
    var quotesLabelForAuthor = LabelView()
    var quotesLabelOfDayTitle = LabelView()
    var quotesLabelOfDayDate = LabelView()
    let activityIndicatorView = ActivityIndicatorView()
    
    let circle = ViewBoxView()
    
    let fetchData = FetchData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        blurEffect(for: circle)
        blurEffect(for: viewBoxForQuotes)
        addViews()
        getQuotes()
        circle.viewBox.backgroundColor = .magenta
    }
    
    override func viewDidLayoutSubviews() {
        settingsForQuotes()
        layoutView()
        settingsForAskButton()
    }
  
    
    
    func getDateFromNow() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: Date())
    }
    
    @objc func askButtonPressed () {
        getAnswer()
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

