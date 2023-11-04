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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        closeButtonConfigure()
        textFieldConfigure()
    }
    
    
}
