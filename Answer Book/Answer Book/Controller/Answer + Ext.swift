//
//  Answer + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 12.10.2023.
//

import UIKit

extension MainViewController {
    //MARK: - Answer
    func configureAnswerView() {
        answerViewBox.viewBox.backgroundColor = .clear
        
        answerLabel.label.textColor = .tertiarySystemGroupedBackground
    
        circleInsideBall.viewBox.layer.cornerRadius = circleInsideBall.viewBox.bounds.width / 2
        
        DispatchQueue.main.async { [weak self] in
            self?.magicBallImage.imageContainer.image = UIImage(named: "ball")
        }
        
        magicBallImage.imageContainer.layer.shadowOpacity = 10
        magicBallImage.imageContainer.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        magicBallImage.imageContainer.layer.shadowRadius = 20
        magicBallImage.imageContainer.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
}
