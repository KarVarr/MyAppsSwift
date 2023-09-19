//
//  MVCButtonPressed + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 19.09.2023.
//

import UIKit

extension MainViewController {
    @objc func shakeButtonPressed () {
        // Reset animation
        answerViewBox.viewBox.layer.removeAllAnimations()
        
        // Update UI for shaking
        answerLabel.label.font = Helper.Font.noteworthyLight(with: 22)
        answerLabel.label.text = "..."
        shakeButton.button.setTitle("...", for: .normal)
        shakeButton.button.backgroundColor = Helper.Colors.lightYellow
        shakeButton.button.isEnabled = false
        
        // Animate shaking
        let animationDuration = 0.1
        view.layoutIfNeeded()
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
            self.answerViewBox.viewBox.transform = CGAffineTransform(translationX: 15, y: 0)
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut, .repeat]) {
                self.answerViewBox.viewBox.transform = CGAffineTransform(translationX: -15, y: 0)
                self.view.layoutIfNeeded()
            }
        }
        
        view.layoutIfNeeded()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self?.fetchAnswer(completion: {
                    DispatchQueue.main.async {
                        self?.answerViewBox.viewBox.layer.removeAllAnimations()
                        self?.answerViewBox.viewBox.transform = .identity
                        self?.shakeButton.button.isEnabled = true
                        self?.shakeButton.button.backgroundColor = Helper.Colors.yellow
                        self?.shakeButton.button.setTitle("SHAKE AGAIN!", for: .normal)
                        self?.view.layoutIfNeeded()
                    }
                })
            }
        }
    }
}
