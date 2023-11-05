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

    
}

