//
//  ProductDetailsVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

class ProductDetailsVC: BaseViewController {
    let customTableViewProductDetailsVC = CustomTableView()
    let scrollViewCustom = ScrollViewCustom()
    let contentViewCustom = ViewCustom()
    let productImage = ImageViewCustom()
    let articleLabel = LabelViewCustom()
    let titleLabel = LabelViewCustom()
    let colorLabel = LabelViewCustom()
    let materialLabel = LabelViewCustom()
    let descriptionLabel = LabelViewCustom()
    let priceLabel = LabelViewCustom()
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImages()
        configureLabels()
        configureCustomTableViewPDVC()
    }
}
