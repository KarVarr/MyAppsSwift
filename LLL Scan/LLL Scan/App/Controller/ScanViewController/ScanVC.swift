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
    let labelForHtml = LabelView()
    let imageForHtml = ImageView()
    let buttonForAddNewTableView = ButtonView()
    
    let urlString = "https://www2.hm.com/de_de/productpage.1213391004.html"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVisionKitSVC()
        configureCustomTableViewSVC()
        configureLabels()
        configureImageView()
        ConfigureButtonView()
        
        networkManager.loadPageFromNetwork(urlString: urlString) { result in
            switch result {
            case .success(let htmlContent):
                let htmlParser = HTMLParser()
                htmlParser.parseHTMLContent(htmlContent)
            case .failure(let error):
                print("Error loading page: \(error)")
            }
        }
    }
    
}

