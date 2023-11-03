//
//  AddNewTaskViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import Foundation

class AddNewTaskViewController: BaseViewController {
    let closeButton = CustomButtonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        closeButtonConfigure()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}
