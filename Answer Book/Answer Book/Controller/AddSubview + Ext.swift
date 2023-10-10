//
//  AddSubview + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 10.10.2023.
//

import Foundation

extension MainViewController {
    func addSubviews() {
        view.addSubview(topCornerCircle.viewBox)
        view.addSubview(bottomCornerCircle.viewBox)
        view.addSubview(quoteViewBox.viewBox)
        quoteViewBox.viewBox.addSubview(activityIndicator.indicator)
        quoteViewBox.viewBox.addSubview(titleLabel.label)
        quoteViewBox.viewBox.addSubview(dateLabel.label)
        quoteViewBox.viewBox.addSubview(quoteLabel.label)
        quoteViewBox.viewBox.addSubview(authorLabel.label)
        
        view.addSubview(answerViewBox.viewBox)
        answerViewBox.viewBox.addSubview(magicBallImage.imageContainer)
        answerViewBox.viewBox.addSubview(circleInsideBall.viewBox)
        answerViewBox.viewBox.addSubview(answerLabel.label)
        
        view.addSubview(shakeButton.button)
    }
}
