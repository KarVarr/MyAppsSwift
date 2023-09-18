//
//  MVCLayout + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 18.09.2023.
//

import UIKit


extension MainViewController {
    func layoutView() {
        let circleTop = circleTopCornerQuote.viewBox
        let circleBottom = circleBottomCornerQuote.viewBox
        
        let viewBoxForQuotes = viewBoxForQuotes.viewBox
        let titleLabel = quotesLabelOfDayTitle.label
        let dateLabel = quotesLabelOfDayDate.label
        let quoteLabel = quotesLabelForQuote.label
        let authorLabel = quotesLabelForAuthor.label
        let activityIndicator = activityIndicatorView.indicator
        
        let viewBoxForAnswer = viewBoxForAnswer.viewBox
        let magicBallInside = magicBallInside.viewBox
        let magicBallImage = magicBallImage.imageContainer
        let answerLabel = answerLabel.label
        
        let askButton = askButton.button
    
        NSLayoutConstraint.activate([
            circleTop.topAnchor.constraint(equalTo: viewBoxForQuotes.topAnchor, constant: -30),
            circleTop.trailingAnchor.constraint(equalTo: viewBoxForQuotes.trailingAnchor, constant: 30),
            circleTop.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            circleTop.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            circleBottom.bottomAnchor.constraint(equalTo: viewBoxForQuotes.bottomAnchor, constant: 30),
            circleBottom.leadingAnchor.constraint(equalTo: viewBoxForQuotes.leadingAnchor, constant: -30),
            circleBottom.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            circleBottom.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            viewBoxForQuotes.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            viewBoxForQuotes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            viewBoxForQuotes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            viewBoxForQuotes.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
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

            viewBoxForAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBoxForAnswer.topAnchor.constraint(equalTo: viewBoxForQuotes.bottomAnchor, constant: 20),
            viewBoxForAnswer.bottomAnchor.constraint(equalTo: askButton.topAnchor, constant: -20),
            viewBoxForAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            viewBoxForAnswer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            magicBallImage.leadingAnchor.constraint(equalTo: viewBoxForAnswer.leadingAnchor),
            magicBallImage.trailingAnchor.constraint(equalTo: viewBoxForAnswer.trailingAnchor),
            magicBallImage.topAnchor.constraint(equalTo: viewBoxForAnswer.topAnchor),
            magicBallImage.bottomAnchor.constraint(equalTo: viewBoxForAnswer.bottomAnchor),
            
            magicBallInside.centerXAnchor.constraint(equalTo: viewBoxForAnswer.centerXAnchor),
            magicBallInside.centerYAnchor.constraint(equalTo: viewBoxForAnswer.centerYAnchor),
            magicBallInside.widthAnchor.constraint(equalToConstant: 150),
            magicBallInside.heightAnchor.constraint(equalToConstant: 150),
            
            answerLabel.centerXAnchor.constraint(equalTo: viewBoxForAnswer.centerXAnchor),
            answerLabel.centerYAnchor.constraint(equalTo: viewBoxForAnswer.centerYAnchor),
            answerLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 130),
            
            askButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            askButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            askButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
