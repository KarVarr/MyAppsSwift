//
//  BaseViewController.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureView()
    }
    
    override func viewWillLayoutSubviews() {
        layoutView()
    }
    
}

@objc extension BaseViewController {
    func addViews() {}
    func configureView() {}
    func layoutView() {}
}
