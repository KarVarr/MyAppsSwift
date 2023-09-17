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
    let fetch = FetchData()
    let answer = Answer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        answerLabel.label.text = "Ask some question!"
    }
    
    override func viewWillLayoutSubviews() {
        settingView()
        layoutView()
    }
    
    //MARK: - Settings
    
    private func addViews() {
        view.addSubview(askButton.button)
        view.addSubview(answerLabel.label)
    }
    
    private func settingView() {
        view.backgroundColor = .magenta
        
        askButton.button.setTitle("Ask", for: .normal)
        askButton.button.backgroundColor = .orange
        askButton.button.layer.cornerRadius = askButton.button.frame.height / 2
        askButton.button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
        
        
    }
    
    private func layoutView() {
        let askButton = askButton.button
        let answerLabel = answerLabel.label
        
        NSLayoutConstraint.activate([
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            askButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            askButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }


    @objc func askButtonPressed () {
        fetch.decodeAPI { [unowned self] answer in
            DispatchQueue.main.async {
                self.answerLabel.label.text = answer.reading
            }
        }
    }
}

