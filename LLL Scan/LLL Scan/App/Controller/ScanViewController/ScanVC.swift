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

    let customTableViewScanVC = CustomTableView()
    let overlayViewForScanner = ViewCustom()
    let resultLabel = LabelViewCustom()
    let labelForHtml = LabelViewCustom()
    let miniatureImageHM = ImageViewCustom()
    let saveButtonForScanner = ButtonViewCustom()
    let buttonForAddNewTableView = ButtonViewCustom()
    
    var urlString: String? = "https://www2.hm.com/pl_pl/productpage.1213391004.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTableViewSVC()
        configureLabels()
        configureImageView()
        configureViewCustom()
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureButtonView()
    }
}

