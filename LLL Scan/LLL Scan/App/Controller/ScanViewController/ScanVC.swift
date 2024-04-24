//
//  ScanVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit
import VisionKit

class ScanVC: BaseViewController {
    let networkManager = NetworkManager()
    let htmlParser = HTMLParser()
    var scannerAvailable: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    
//    var scannedProducts: [Product] = []
//    var scannedProductsDictionary: [String: [Product]] = [:]
//    var currentCellTitle: String = ""
//    var cellTitles: [Int: String] = [:]
    var scannedProducts: [[Product]] = []
    
    
    let customTableViewScanVC = CustomTableView()
    let overlayViewForScanner = ViewCustom()
    let resultLabel = LabelViewCustom()
    let labelForHtml = LabelViewCustom()
    let miniatureImageHM = ImageViewCustom()
    let saveButtonForScanner = ButtonViewCustom()
    let titleFromParsingLabel = LabelViewCustom()
    let colorFromParsingLabel = LabelViewCustom()
    let materialFromParsingLabel = LabelViewCustom()
    let buttonForAddNewTableView = ButtonViewCustom()
    let vStackForParsingData = ViewStackCustom()
    let topRectangleViewForCloseIndication = ViewCustom()
    
    var urlString: String? = "https://www2.hm.com/pl_pl/productpage.1213391004.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTableViewSVC()
        configureLabels()
        configureImageView()
        configureViewCustom()
        configureStackViewSVC()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureButtonView()
    }
}

