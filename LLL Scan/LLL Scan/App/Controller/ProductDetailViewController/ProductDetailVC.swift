//
//  ProductDetailVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

class ProductDetailVC: BaseViewController {
    let customTableViewProductDetailVC = CustomTableView()
    var product: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTableViewPDVC()
        
    }
    


}
