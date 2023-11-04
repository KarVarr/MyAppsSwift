//
//  AddNewTaskViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//



import UIKit


class AddNewTaskViewController: BaseViewController {
    
    let closeButton = CustomButtonView()
    let titleTextField = CustomTextField()
    let descriptionTextField = CustomTextField()
    
    let closeButtonCALayer = CustomView()
    let doneButtonCALayer = CustomView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        closeButtonConfigure()
        textFieldConfigure()
        closeButtonCAShapeLayer()
        doneButtonCAShapeLayer()
        
        updateButtonLayers()
        
    }
    
    func closeButtonCAShapeLayer() {
        let crossLayer = CAShapeLayer()
        crossLayer.lineWidth = 5
        crossLayer.strokeColor = UIColor.systemPink.cgColor
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
        checkmarkLayer.strokeColor = UIColor.systemBlue.cgColor
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

