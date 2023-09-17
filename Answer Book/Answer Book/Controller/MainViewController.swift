//
//  MainViewController.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
    }
    
    override func viewWillLayoutSubviews() {
        settingView()
        layoutView()
    }
    
    private func addViews() {
        
    }
    
    private func settingView() {
        view.backgroundColor = .magenta
        
    }
    
    private func layoutView() {
        
    }


}

