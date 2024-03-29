//
//  ButtonPressed + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 19.09.2023.
//

import UIKit

extension MainViewController {
    func configureShakeButton() {
        shakeButton.button.titleLabel?.font = Helper.Font.noteworthyBold(with: dynamicFontSize(20))
        shakeButton.button.layer.cornerRadius = shakeButton.button.frame.height / 2
        shakeButton.button.addTarget(self, action: #selector(shakeButtonPressed), for: .touchUpInside)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        shakeButtonPressed()
    }
    
    @objc func shakeButtonPressed () {
        //Haptic Touch
        let generate = UINotificationFeedbackGenerator()
        generate.prepare()
        generate.notificationOccurred(.success)
        
        // Reset animation
        answerViewBox.viewBox.layer.removeAllAnimations()
        
        // Update UI for shaking
        answerLabel.label.font = Helper.Font.noteworthyLight(with: dynamicFontSize(21))
        answerLabel.label.text = Helper.String.threeDots
        shakeButton.button.setTitle(Helper.String.threeDots, for: .normal)
        shakeButton.button.backgroundColor = Helper.Colors.lightYellow
        shakeButton.button.isEnabled = false
     
        // Animate shaking
        let animationDuration = 0.1
        view.layoutIfNeeded()
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
            self.answerViewBox.viewBox.transform = CGAffineTransform(translationX: 15, y: -3)
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut, .repeat]) {
                self.answerViewBox.viewBox.transform = CGAffineTransform(translationX: -15, y: 3)
                self.view.layoutIfNeeded()
            }
        }
        
        // Fetch Answer
        view.layoutIfNeeded()
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self?.fetchAnswer(completion: {
                    DispatchQueue.main.async {
                        self?.answerViewBox.viewBox.layer.removeAllAnimations()
                        self?.answerViewBox.viewBox.transform = .identity
                        self?.shakeButton.button.isEnabled = true
                        self?.shakeButton.button.backgroundColor = Helper.Colors.yellow
                        self?.shakeButton.button.setTitle(Helper.String.buttonTitleAfterPress, for: .normal)
                        self?.view.layoutIfNeeded()
                    }
                })
            }
        }
    }
}
