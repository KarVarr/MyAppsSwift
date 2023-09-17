//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let askButton = ButtonView()
    let answerLabel = LabelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
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
        
        answerLabel.label.text = "Ask some question!"
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


}

