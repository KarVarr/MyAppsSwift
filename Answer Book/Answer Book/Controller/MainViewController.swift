//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let askButton = ButtonView()
    var answerLabel = LabelView()
    var quotesLabel = LabelView()
    
    let fetch = FetchData()
    let answer = Answer()
    
    let answerUrl = "https://www.eightballapi.com/api"
    let quotesUrl = "https://zenquotes.io/api/today"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        answerLabel.label.text = "Ask some question!"
        quotesLabel.label.text = "It is the mark of an educated mind to be able to entertain a thought without accepting it."
        
    }
    
    override func viewWillLayoutSubviews() {
        settingView()
        layoutView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getQuotes()
    }
    
    //MARK: - Settings
    
    private func addViews() {
        view.addSubview(askButton.button)
        view.addSubview(answerLabel.label)
        view.addSubview(quotesLabel.label)
        
    }
    
    private func settingView() {
        view.backgroundColor = .white
        
        quotesLabel.label.numberOfLines = 0
        quotesLabel.label.layer.borderWidth = 1
        
        askButton.button.setTitle("Ask question", for: .normal)
        askButton.button.backgroundColor = .orange
        askButton.button.layer.cornerRadius = askButton.button.frame.height / 2
        askButton.button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
    }
    
    private func layoutView() {
        let askButton = askButton.button
        let answerLabel = answerLabel.label
        let quotesLabel = quotesLabel.label
        
        NSLayoutConstraint.activate([
            quotesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quotesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            quotesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            quotesLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            
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
                    self.quotesLabel.label.text = $0.q
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

