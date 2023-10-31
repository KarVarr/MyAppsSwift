//
//  BaseViewController.swift
//  DDTL
//
//  Created by Karen Vardanian on 31.10.2023.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setNavTitle(title: Tabs) {
        navigationItem.title = Helper.Strings.NavTitle.title(for: title)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
