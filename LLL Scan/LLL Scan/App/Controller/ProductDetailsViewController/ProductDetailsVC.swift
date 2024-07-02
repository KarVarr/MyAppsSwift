//
//  ProductDetailsVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit
import SkeletonView

struct SectionHeaders {
    let title: String
}

class ProductDetailsVC: BaseViewController {
    let customTableViewProductDetailsVC = CustomTableView(frame: .zero, style: .insetGrouped)
    let contentViewCustom = ViewCustom()
    let productImage = ImageViewCustom()
    
    var sectionHeader = [
        SectionHeaders(title: "Артикул"),
        SectionHeaders(title: "Название"),
        SectionHeaders(title: "Цвет"),
        SectionHeaders(title: "Состав"),
        SectionHeaders(title: "Категория"),
        SectionHeaders(title: "Описание"),
        SectionHeaders(title: "Цена"),
        SectionHeaders(title: "Пол"),
        SectionHeaders(title: "Детский пол")
    ]

    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImages()
        configureCustomTableViewPDVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customTableViewProductDetailsVC.isSkeletonable = true
        customTableViewProductDetailsVC.showGradientSkeleton()
    }
}
