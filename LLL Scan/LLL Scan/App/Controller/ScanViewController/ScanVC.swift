//
//  ScanVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit
import VisionKit
import AVFoundation
import Vision

final class ScanVC: BaseViewController {
    var captureSession: AVCaptureSession!
        var previewLayer: AVCaptureVideoPreviewLayer!
    let dataManager = DataManager.shared
    let networkManager = NetworkManager()
    let htmlParser = HTMLParser()
    var productObj: Product?
    
    var scannerAvailable: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    
    //HapticTouch
    let notificationGenerator = UINotificationFeedbackGenerator()
    //table
    let customTableViewScanVC = CustomTableView()
    //labels
    let resultLabel = LabelViewCustom()
    let labelForHtml = LabelViewCustom()
    let titleFromParsingLabel = LabelViewCustom()
    let colorFromParsingLabel = LabelViewCustom()
    let materialFromParsingLabel = LabelViewCustom()
    let showCountOfProductsInArray = LabelViewCustom()
    //buttons
    let saveOneProductButtonForScanner = ButtonViewCustom()
    let saveAllButtonForScanner = ButtonViewCustom()
    let buttonForAddNewTableView = ButtonViewCustom()
    //images
    let emptyStateImageView = ImageViewCustom()
    let miniatureImageHM = ImageViewCustom()
    //views
    let overlayViewForScanner = ViewCustom()
    let vStackForParsingData = ViewStackCustom()
    let topRectangleViewForCloseIndication = ViewCustom()
    
    var urlString: String? = "https://www2.hm.com/en_gb/productpage.1213391004.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCustomTableViewSVC()
        configureViewCustom()
        configureStackViewSVC()
        configureNavBar()
        dataManager.allProducts = dataManager.loadAllProducts()
        customTableViewScanVC.table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavBar()
        customTableViewScanVC.table.reloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureImageView()
        configureLabels()
        configureButtonView()
    }
}

