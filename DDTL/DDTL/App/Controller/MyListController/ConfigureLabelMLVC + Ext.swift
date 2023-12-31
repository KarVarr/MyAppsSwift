//
//  ConfigureLabelMLVC + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit



extension MyListViewController {
    func configureLabel() {
        settings(pointingFingerLabelTop, with: Helper.Strings.MyListVC.titleTop, x: 0, y: -300)
        settings(pointingFingerLabelMiddle, with: Helper.Strings.MyListVC.titleMiddle, x: -300, y: 0)
        settings(pointingFingerLabelBottom, with: Helper.Strings.MyListVC.titleBottom, x: 300, y: 0)
        
        colorLabel.label.text = "Gradient text"
        colorLabel.label.font = UIFont.systemFont(ofSize: 24)
        colorLabel.label.sizeToFit()
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = colorLabel.label.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = colorLabel.label.bounds
        maskLayer.path = CGPath(rect: colorLabel.label.bounds, transform: nil)
        maskLayer.fillColor = UIColor.clear.cgColor
        maskLayer.strokeColor = UIColor.white.cgColor
        maskLayer.lineWidth = colorLabel.label.font.pointSize
        maskLayer.lineJoin = .round
        maskLayer.lineCap = .round
        maskLayer.contents = colorLabel.label.layer.contents
        
        gradientLayer.mask = maskLayer
        colorLabel.label.layer.addSublayer(gradientLayer)
        
        view.addSubview(colorLabel.label)
    }
    
    func animationPointingTitleLabels() {
        view.layoutIfNeeded()
        let labelsDictionary = [pointingFingerLabelTop.label: 0.3, pointingFingerLabelMiddle.label: 0.6, pointingFingerLabelBottom.label: 0.9]
        
        
        for (labels, time) in labelsDictionary {
            UIView.animate(withDuration: 0.5, delay: time, options: .curveEaseIn) {
                labels.transform = CGAffineTransform(translationX: 0, y: 0)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    private func settings(_ label: CustomLabelView, with text: String, x numberX: CGFloat, y numberY: CGFloat) {
        label.label.text = text
        label.label.font = Helper.Fonts.ChalkboardSERegular(with: 38)
        label.label.textColor = Helper.Colors.darkBlue
        
        label.label.layer.shadowColor = Helper.Colors.redOrange.cgColor
        label.label.layer.shadowRadius = 1
        label.label.layer.shadowOpacity = 5
        label.label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.label.layer.masksToBounds = false
        
        label.label.transform = CGAffineTransform(translationX: numberX, y: numberY)
    }
    
    
}
