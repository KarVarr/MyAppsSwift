//
//  ListOfProductsVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

class ListOfProductsVC: BaseViewController {
    let dataManager = DataManager.shared
    let customTableViewProductDetailVC = CustomTableView()
    var product: [Products] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTableViewLPVC()
    }
}
