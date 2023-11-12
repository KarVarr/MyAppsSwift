//
//  AddNewTaskViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//



import UIKit


class AddNewTaskViewController: BaseViewController {
    
    
    let navTitle = CustomLabelView()
    let closeButton = CustomButtonView()
    let titleTextField = CustomTextField()
    let descriptionTextView = CustomTextView()
    
    let closeButtonCALayer = CustomView()
    let doneButtonCALayer = CustomView()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textFieldConfigure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Helper.Colors.palePink
        navTitle.label.text = "A D D    T A S K"
        navTitle.label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        textViewConfigure()
        closeButtonConfigure()
        
        updateButtonLayers()
    }

}

