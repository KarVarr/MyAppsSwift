//
//  BaseViewController.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import Foundation
import UIKit

public class BaseViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureView()
    }
    
    public override func viewWillLayoutSubviews() {
        layoutView()
    }
    
}

@objc extension BaseViewController {
    func addViews() {}
    func configureView() {}
    func layoutView() {}
}
