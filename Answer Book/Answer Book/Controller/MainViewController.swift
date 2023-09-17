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
    
    
    let fetch = FetchData()
    let answer = Answer()
    
    let answerUrl = "https://www.eightballapi.com/api"
    let quotesUrl = "https://zenquotes.io/api/today"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        answerLabel.label.text = "Ask some question!"
        quotesLabelForQuote.label.text = "It is the mark of an educated mind to be able to entertain a thought without accepting it."
        quotesLabelForAuthor.label.text = "VAN GOG"
        viewBoxForQuotes.viewBox.backgroundColor = .orange
    }
    
    override func viewWillLayoutSubviews() {
        settingView()
        layoutView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quotesLabelOfDayTitle.label.text = "Quote of the Day"
        quotesLabelOfDayDate.label.text = "\(Date())"
//        getQuotes()
    }
    
    //MARK: - Settings
    
    private func addViews() {
        view.addSubview(viewBoxForQuotes.viewBox)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelOfDayTitle.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelOfDayDate.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelForQuote.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelForAuthor.label)
        
        view.addSubview(askButton.button)
        view.addSubview(answerLabel.label)
        
    }
    
    private func settingView() {
        view.backgroundColor = .white
        
        quotesLabelForQuote.label.numberOfLines = 0
        quotesLabelForQuote.label.layer.borderWidth = 1
        
        askButton.button.setTitle("Ask question", for: .normal)
        askButton.button.backgroundColor = .orange
        askButton.button.layer.cornerRadius = askButton.button.frame.height / 2
        askButton.button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
    }
    
    private func layoutView() {
        let viewBoxForQuotes = viewBoxForQuotes.viewBox
        let title = quotesLabelOfDayTitle.label
        let date = quotesLabelOfDayDate.label
        let quote = quotesLabelForQuote.label
        let author = quotesLabelForAuthor.label
        let askButton = askButton.button
        let answerLabel = answerLabel.label
        
        NSLayoutConstraint.activate([
            viewBoxForQuotes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewBoxForQuotes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            viewBoxForQuotes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            viewBoxForQuotes.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            title.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            title.topAnchor.constraint(equalTo: viewBoxForQuotes.topAnchor, constant: 10),
            
            date.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            date.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            
            quote.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            quote.centerYAnchor.constraint(equalTo: viewBoxForQuotes.centerYAnchor),
            quote.leadingAnchor.constraint(equalTo: viewBoxForQuotes.leadingAnchor, constant: 10),
            quote.trailingAnchor.constraint(equalTo: viewBoxForQuotes.trailingAnchor, constant: -10),
            
            author.trailingAnchor.constraint(equalTo: viewBoxForQuotes.trailingAnchor, constant: -15),
            author.bottomAnchor.constraint(equalTo: viewBoxForQuotes.bottomAnchor, constant: -15),
            
            
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            askButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            askButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    @objc func askButtonPressed () {
        getAnswer()
    }
    
    func getQuotes() {
        fetch.decodeAPI(at: quotesUrl) { [unowned self] (quotes: [Quotes]?) in
            DispatchQueue.main.async {
                quotes?.forEach {
                    self.quotesLabelForQuote.label.text = "\"\($0.q)\""
                    self.quotesLabelForAuthor.label.text = $0.a
                }
            }
        }
    }
    
    func getAnswer() {
        fetch.decodeAPI(at: answerUrl) { [unowned self] (answer: Answer?) in
            DispatchQueue.main.async {
                self.answerLabel.label.text = answer?.reading
            }
        }
    }
}

