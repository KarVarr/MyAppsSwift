//
//  CloseButtonConfigure + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    func closeButtonConfigure() {
//        closeButton.button.setImage(UIImage(named: "closeButton"), for: .normal)
//        closeButton.button.imageView?.contentMode = .scaleAspectFit
//        closeButton.button.tintColor = .systemPink
       
        closeButton.button.addSubview(closeButtonCALayer.view)
        closeButton.button.addSubview(doneButtonCALayer.view)
        closeButtonCALayer.view.frame = closeButton.button.bounds
        
        closeButton.button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    @objc func closeView() {
        dismiss(animated: true)
        
    }
    
    
    func closeButtonCAShapeLayer() {
        let crossLayer = CAShapeLayer()
        crossLayer.lineWidth = 5
        crossLayer.strokeColor = Helper.Colors.pink.cgColor
        crossLayer.lineCap = .round
        
        let crossPath = UIBezierPath()
        crossPath.move(to: CGPoint(x: 10, y: 10))
        crossPath.addLine(to: CGPoint(x: 40, y: 40))
        crossPath.move(to: CGPoint(x: 40, y: 10))
        crossPath.addLine(to: CGPoint(x: 10, y: 40))
        
        crossLayer.path = crossPath.cgPath
        
        closeButtonCALayer.view.layer.addSublayer(crossLayer)
        
    }
    
    func doneButtonCAShapeLayer() {
        let checkmarkLayer = CAShapeLayer()
        checkmarkLayer.lineWidth = 5
        checkmarkLayer.strokeColor = Helper.Colors.blue.cgColor
        checkmarkLayer.lineCap = .round
        checkmarkLayer.lineJoin = .round
        checkmarkLayer.fillColor = UIColor.clear.cgColor
        
        let checkmarkPath = UIBezierPath()
        checkmarkPath.move(to: CGPoint(x: 10, y: 30))
        checkmarkPath.addLine(to: CGPoint(x: 20, y: 40))
        checkmarkPath.addLine(to: CGPoint(x: 40, y: 10))
        
        checkmarkLayer.path = checkmarkPath.cgPath
        
        doneButtonCALayer.view.layer.addSublayer(checkmarkLayer)
    }
    
}
