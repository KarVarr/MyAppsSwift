//
//  ProductDetailsVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

class ProductDetailsVC: BaseViewController {
    let productImage = ImageViewCustom()
    let articleLabel = LabelViewCustom()
    let titleLabel = LabelViewCustom()
    let colorLabel = LabelViewCustom()
    let materialLabel = LabelViewCustom()
    let descriptionLabel = LabelViewCustom()
    let priceLabel = LabelViewCustom()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"
        view.backgroundColor = .magenta
    }
    

}
