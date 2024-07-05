//
//  ListOfProductsVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit
import SkeletonView

class ListOfProductsVC: BaseViewController {
    let dataManager = DataManager.shared
    let customTableViewProductDetailVC = CustomTableView()
    var product: [Product] = []
    var productListIndex: Int? 
    var titleForProduct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCustomTableViewLPVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        customTableViewProductDetailVC.isSkeletonable = true
        customTableViewProductDetailVC.showGradientSkeleton(
            usingGradient: .init(baseColor: .carrot),
            transition: .crossDissolve(0.25)
        )
        customTableViewProductDetailVC.table.reloadData()
    }
}
