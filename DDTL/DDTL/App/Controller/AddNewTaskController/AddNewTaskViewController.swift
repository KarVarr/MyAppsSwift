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
    
    weak var delegate: DataDelegate?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textFieldConfigure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewConfigure()
        closeButtonConfigure()
        
        updateButtonLayers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTextField.textField.becomeFirstResponder()
    }
    
}

