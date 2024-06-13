//
//  ConfigureViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import Foundation
import UIKit
import VisionKit

extension ScanVC: DataScannerViewControllerDelegate {
    override func configureView() {
        view.backgroundColor = .white
        title = "Сканы"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        overlayViewForScanner.vc.isHidden = true
    }
    
    @objc func newScan() {
        // presentTitleInputAlert()
        startScanning()
    }
    
    @objc func saveOneProductResult() {
        print("saveResult")
        
        guard let productObj = self.productObj else {
            print("Error: productObj is nil")
            return
        }
        

        manager.addNewProduct(product: productObj)
        self.showCountOfProductsInArray.label.text = String(manager.products.count)
        self.productObj = nil
        customTableViewScanVC.table.reloadData()
    }
    
    @objc func saveAllResult() {
        guard !dataManager.productList.isEmpty else {
            print("No products to save")
            return
        }
        

        let countProductsArray = dataManager.productList.count
        
        DispatchQueue.main.async {
            self.miniatureImageHM.imageView.image = UIImage(systemName: "checkmark.circle")
            self.miniatureImageHM.imageView.addSymbolEffect(.bounce, animated: true)
            self.miniatureImageHM.imageView.tintColor = .green
            self.miniatureImageHM.imageView.clipsToBounds = false
            
            self.titleFromParsingLabel.label.text = "Все отсканированные артикулы сохранены!"
            self.colorFromParsingLabel.label.text = "Закройте экран сканирования потянув вниз ↓"
            self.materialFromParsingLabel.label.text = "Вы отсканировали \(countProductsArray) артикулов"
        }
        

        print(dataManager.productList.count, "-------------> Count")
 
        manager.addScannedProductsGroup(manager.products)
        manager.products.removeAll()
        customTableViewScanVC.table.reloadData()
        self.showCountOfProductsInArray.label.text = String(dataManager.productList.count)
        
        print("all save and append in array MOTHER FUCKER")
    }
    
    private func startScanning() {
        guard scannerAvailable == true else {
            print(" Error: Scanner is not available for usage. Please check settings")
            return
        }
        
        resultLabel.label.text = "Отсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'.\n· Номер начинается с букв, за которыми следует пробел.\n· После пробела идет 7 цифр.\n· Затем следует еще один пробел и 3 цифры.\n· После третьих цифр идут буквы и еще несколько цифр."
        
        DispatchQueue.main.async {
            self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
            self.titleFromParsingLabel.label.text = nil
            self.colorFromParsingLabel.label.text = nil
            self.materialFromParsingLabel.label.text = nil
        }
        
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.text()],
                                                    isHighFrameRateTrackingEnabled: true,
                                                    isPinchToZoomEnabled: true,
                                                    isHighlightingEnabled: true
        )
        
        dataScanner.delegate = self
        dataScanner.modalPresentationStyle = .formSheet
        
        present(dataScanner, animated: true) {
            dataScanner.view.addSubview(self.overlayViewForScanner.vc)
            self.overlayViewForScanner.vc.isHidden = false
            NSLayoutConstraint.activate([
                self.overlayViewForScanner.vc.leadingAnchor.constraint(equalTo: dataScanner.view.leadingAnchor),
                self.overlayViewForScanner.vc.trailingAnchor.constraint(equalTo: dataScanner.view.trailingAnchor),
                self.overlayViewForScanner.vc.topAnchor.constraint(equalTo: dataScanner.view.topAnchor),
                self.overlayViewForScanner.vc.heightAnchor.constraint(equalTo: dataScanner.view.heightAnchor, multiplier: 0.7)
            ])
            
            self.overlayViewForScanner.vc.alpha = 0.0
            UIView.animate(withDuration: 0.5) {
                self.overlayViewForScanner.vc.alpha = 1.0
            }
        }
        try? dataScanner.startScanning()
    }
    
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        guard case .text(let text) = item else { return }
        let regex = try! Regex(#"\s*\b\d{7}\s\b\d{3}\s*"#)
        
        if !text.transcript.matches(of: regex).isEmpty {
            let parts = text.transcript.components(separatedBy: " ")
            
            if parts.count <= 4 && parts.count >= 3 {
                scanCodeWithDifferentCount(partsStr: parts, part1: 1, part2: 2)
            } else if parts.count <= 2 {
                scanCodeWithDifferentCount(partsStr: parts, part1: 0, part2: 1)
            } else {
                print("Error: Not such code")
                DispatchQueue.main.async {
                    self.resultLabel.label.text = "❌ \(parts) Не верный формат артикула!\nОтсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'."
                    self.titleFromParsingLabel.label.text = "Не найдено"
                    self.colorFromParsingLabel.label.text = "Не найдено"
                    self.materialFromParsingLabel.label.text = "Не найдено"
                    self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
                }
            }
        } else {
            DispatchQueue.main.async {
                self.resultLabel.label.text = "❌ \(text.transcript) Не верный формат артикула!\nОтсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'."
                self.titleFromParsingLabel.label.text = "Не верный формат артикула"
                self.colorFromParsingLabel.label.text = "Отсканируйте выделенный артикул как на фото"
                self.materialFromParsingLabel.label.text = "И повторите попытку!"
                self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
            }
            print("non valid regex art")
        }
    }
    
    private func scanCodeWithDifferentCount(partsStr: [String], part1: Int, part2: Int) {
        let result = "\(partsStr[part1])\(partsStr[part2])"
        print("Result article : \(result)")
        resultLabel.label.text = "✅ Артикул: \(result)".trimmingCharacters(in: .whitespacesAndNewlines)
        
        self.urlString = "https://www2.hm.com/en_gb/productpage.\(result).html"
        
        if let urlString = self.urlString {
            networkManager.loadPageFromNetwork(urlString: urlString) { [weak self] result in
                switch result {
                case .success(let htmlContent):
                    let htmlParser = HTMLParser()
                    let productResult = htmlParser.parseHTMLContent(htmlContent)
                    
                    switch productResult {
                    case .success(let product):
                        if let imageURLString = product.imageURL,
                           let decodedImageURLString = imageURLString.removingPercentEncoding,
                           let imageURL = URL(string: "https:"+decodedImageURLString) {
                            URLSession.shared.dataTask(with: imageURL) {
                                data,
                                response,
                                error in
                                if let error = error {
                                    print("Error loading image: \(error)")
                                    return
                                }
                                guard let imageData = data else {
                                    print("No image data received")
                                    return
                                }
                                DispatchQueue.main.async {
                                    self?.colorFromParsingLabel.label.isHidden = false
                                    self?.materialFromParsingLabel.label.isHidden = false
                                    self?.titleFromParsingLabel.label.text = product.title
                                    self?.colorFromParsingLabel.label.text = product.color
                                    self?.materialFromParsingLabel.label.text = product.material
                                    self?.miniatureImageHM.imageView.image = UIImage(data: imageData)
                                    
//                                    self?.productObj = CoreDataManager.shared.createProduct(
//                                        id: UUID(),
//                                        imageURL: product.imageURL,
//                                        link: product.link,
//                                        article: product.article,
//                                        title: product.title,
//                                        price: product.price,
//                                        color: product.color,
//                                        description: product.description,
//                                        material: product.material,
//                                        gender: product.gender,
//                                        babyGender: product.babyGender,
//                                        addedAt: Date()
                                    
                                    self?.productObj = self?.manager.createProduct (
                                        id: UUID(),
                                        imageURL: product.imageURL,
                                        link: product.link,
                                        article: product.article,
                                        title: product.title,
                                        price: product.price,
                                        color: product.color,
                                        description: product.description,
                                        material: product.material,
                                        gender: product.gender,
                                        babyGender: product.babyGender,
                                        addedAt: Date()
                                    )
                                }
                            }.resume()
                        } else {
                            print("Invalid image URL")
                            DispatchQueue.main.async {
                                self?.titleFromParsingLabel.label.text = "Артикул определен, но данный товар отсутствует на сайте H&M!"
                                self?.colorFromParsingLabel.label.isHidden = true
                                self?.materialFromParsingLabel.label.isHidden = true
                                self?.miniatureImageHM.imageView.image = UIImage(systemName: "exclamationmark.icloud.fill")
                                
                            }
                        }
                        
                    case .failure(let error):
                        print("Error parsing HTML content: \(error)")
                    }
                case .failure(let error):
                    print("Error loading page: \(error)")
                }
            }
        }
    }
    
    //    private func presentTitleInputAlert() {
    //        let alert = UIAlertController(title: "Enter Cell Title", message: nil, preferredStyle: .alert)
    //        alert.addTextField { textField in
    //            textField.placeholder = "Enter title"
    //        }
    //        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
    //            if let title = alert.textFields?.first?.text {
    //                let formatter = DateFormatter()
    //                formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
    //                let formattedDate = formatter.string(from: Date())
    //                let uniqueTitle = "\(title)_\(formattedDate)"
    //
    //                self?.currentCellTitle = uniqueTitle
    //                self?.startScanning()
    //            }
    //        }
    //        alert.addAction(addAction)
    //        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    //        present(alert, animated: true, completion: nil)
    //    }
    
}


