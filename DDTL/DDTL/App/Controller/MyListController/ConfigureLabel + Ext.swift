//
//  ConfigureLabel + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit

extension MyListViewController {
    func configureLabel() {
        settings(pointingFingerLabelTop, with: "ADD", x: 0, y: -300)
        settings(pointingFingerLabelMiddle, with: "NEW", x: -300, y: 0)
        settings(pointingFingerLabelBottom, with: "TASK", x: 300, y: 0)
    }
    
    func animationPointingTitleLabels() {
        view.layoutIfNeeded()
        let labelsDictionary = [pointingFingerLabelTop.label: 0.3, pointingFingerLabelMiddle.label: 0.6, pointingFingerLabelBottom.label: 0.9]
        
        
        for (labels, time) in labelsDictionary {
            UIView.animate(withDuration: 1, delay: time,  options: .curveEaseIn) {
                labels.transform = CGAffineTransform(translationX: 0, y: 0)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func settings(_ label: CustomLabelView, with text: String, x numberX: CGFloat, y numberY: CGFloat) {
        label.label.text = text
        label.label.font = Helper.Fonts.ChalkboardSERegular(with: 28)
        label.label.textColor = Helper.Colors.darkBlue
        
        label.label.layer.shadowColor = Helper.Colors.redOrange.cgColor
        label.label.layer.shadowRadius = 1
        label.label.layer.shadowOpacity = 5
        label.label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.label.layer.masksToBounds = false
        
        label.label.transform = CGAffineTransform(translationX: numberX, y: numberY)
    }
}
