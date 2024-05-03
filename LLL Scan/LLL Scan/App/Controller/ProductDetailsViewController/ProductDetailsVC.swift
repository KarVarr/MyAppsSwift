//
//  ProductDetailsVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

struct SectionHeaders {
    let title: String
}


class ProductDetailsVC: BaseViewController {
    let customTableViewProductDetailsVC = CustomTableView(frame: .zero, style: .insetGrouped)
    let scrollViewCustom = ScrollViewCustom()
    let contentViewCustom = ViewCustom()
    let productImage = ImageViewCustom()
    
    var sectionHeader = [
        SectionHeaders(title: "Артикл"),
        SectionHeaders(title: "Название"),
        SectionHeaders(title: "Цвет"),
        SectionHeaders(title: "Состав"),
        SectionHeaders(title: "Описание"),
        SectionHeaders(title: "Цена"),
    ]
//    let articleLabel = LabelViewCustom()
//    let titleLabel = LabelViewCustom()
//    let colorLabel = LabelViewCustom()
//    let materialLabel = LabelViewCustom()
//    let descriptionLabel = LabelViewCustom()
//    let priceLabel = LabelViewCustom()
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImages()
//        configureLabels()
        configureCustomTableViewPDVC()
    }
}
