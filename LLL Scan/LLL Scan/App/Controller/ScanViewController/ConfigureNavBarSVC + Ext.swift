//
//  ConfigureNavBarSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 29.06.2024.
//

import Foundation
import UIKit

extension ScanVC {
    func configureNavBar() {
        title = "LL Scan"
        navigationController?.navigationBar.prefersLargeTitles = false
        let deleteAll = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(deleteAllButton))
        navigationItem.rightBarButtonItem = deleteAll
    }
}
