//
//  MVCSettings + Ext .swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

extension MainViewController {
    
    func addViews() {
        view.addSubview(circle.viewBox)
        view.addSubview(viewBoxForQuotes.viewBox)
        viewBoxForQuotes.viewBox.addSubview(activityIndicatorView.indicator)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelOfDayTitle.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelOfDayDate.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelForQuote.label)
        viewBoxForQuotes.viewBox.addSubview(quotesLabelForAuthor.label)
        
        view.addSubview(askButton.button)
        view.addSubview(answerLabel.label)
    }
    
    func settingView() {
        view.backgroundColor = .darkGray
        answerLabel.label.text = "Ask some question!"
    }
    
    func settingsForQuotes() {
        viewBoxForQuotes.viewBox.clipsToBounds = true
        viewBoxForQuotes.viewBox.layer.cornerRadius = 30
        viewBoxForQuotes.viewBox.layer.borderWidth = 1
        viewBoxForQuotes.viewBox.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        
        quotesLabelOfDayTitle.label.text = Helper.String.quotesTitle
        quotesLabelOfDayTitle.label.font = Helper.Font.GillSansBold(with: 20)
        
        
        quotesLabelOfDayDate.label.text = getDateFromNow()
        quotesLabelOfDayDate.label.font = Helper.Font.GillSansBold(with: 12)
        quotesLabelOfDayDate.label.textColor = .secondaryLabel
        
        
        quotesLabelForQuote.label.numberOfLines = 0
        quotesLabelForQuote.label.textAlignment = .center
        quotesLabelForQuote.label.font = Helper.Font.Thonburi(with: 24)
    }
    
    
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = viewBoxForQuotes.viewBox.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewBoxForQuotes.viewBox.bounds
        gradientLayer.colors = Helper.Colors.whiteGradient
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.25)
        
        viewBoxForQuotes.viewBox.addSubview(blurView)
        viewBoxForQuotes.viewBox.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func settingsForAskButton() {
        askButton.button.backgroundColor = .magenta
        askButton.button.setTitle("Ask question", for: .normal)
        askButton.button.layer.cornerRadius = askButton.button.frame.height / 2
        askButton.button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
    }
    
    func layoutView() {
        let viewBoxForQuotes = viewBoxForQuotes.viewBox
        let titleLabel = quotesLabelOfDayTitle.label
        let dateLabel = quotesLabelOfDayDate.label
        let quoteLabel = quotesLabelForQuote.label
        let authorLabel = quotesLabelForAuthor.label
        let activityIndicator = activityIndicatorView.indicator
        let askButton = askButton.button
        let answerLabel = answerLabel.label
        
        NSLayoutConstraint.activate([
            circle.viewBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.viewBox.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            circle.viewBox.widthAnchor.constraint(equalToConstant: 200),
            circle.viewBox.heightAnchor.constraint(equalToConstant: 200),
            
            viewBoxForQuotes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewBoxForQuotes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            viewBoxForQuotes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            viewBoxForQuotes.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            activityIndicator.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: viewBoxForQuotes.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 100),
            activityIndicator.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: viewBoxForQuotes.topAnchor, constant: 10),
            
            dateLabel.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            quoteLabel.centerXAnchor.constraint(equalTo: viewBoxForQuotes.centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: viewBoxForQuotes.centerYAnchor),
            quoteLabel.leadingAnchor.constraint(equalTo: viewBoxForQuotes.leadingAnchor, constant: 10),
            quoteLabel.trailingAnchor.constraint(equalTo: viewBoxForQuotes.trailingAnchor, constant: -10),
            
            authorLabel.trailingAnchor.constraint(equalTo: viewBoxForQuotes.trailingAnchor, constant: -20),
            authorLabel.bottomAnchor.constraint(equalTo: viewBoxForQuotes.bottomAnchor, constant: -15),
            
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            askButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            askButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
