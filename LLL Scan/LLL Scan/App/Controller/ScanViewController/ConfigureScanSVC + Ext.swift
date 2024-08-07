//
//  ConfigureScanSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 29.06.2024.
//

import UIKit
import VisionKit
import SkeletonView

extension ScanVC: DataScannerViewControllerDelegate {
    
    //MARK: - START Scanning
    func startScanning() {
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
            self.overlayViewForScanner.vc.isHidden = false
            dataScanner.view.addSubview(self.overlayViewForScanner.vc)
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
    
    //MARK: - DATA Scanner
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
        guard case .text(let text) = item else { return }
        
        let regex = try! Regex(#"\s*\b\d{7}\s\b\d{3}\s*"#)
        
        if !text.transcript.matches(of: regex).isEmpty {
            let parts = text.transcript.components(separatedBy: " ")
            
            if parts.count <= 4 && parts.count >= 3 {
                startSkeleton()
                scanCodeWithDifferentCount(partsStr: parts, part1: 1, part2: 2)
            } else if parts.count <= 2 {
                startSkeleton()
                scanCodeWithDifferentCount(partsStr: parts, part1: 0, part2: 1)
            } else {
                handleInvalidCode(parts: parts)
            }
        } else {
            handleInvalidCode(parts: text.transcript.components(separatedBy: " "))
        }
    }
    
    private func handleInvalidCode(parts: [String]) {
        DispatchQueue.main.async {
            self.stopSkeleton()
            self.colorFromParsingLabel.label.isHidden = false
            self.materialFromParsingLabel.label.isHidden = false
            self.resultLabel.label.text = "❌ \(parts.joined(separator: " ")) Не верный формат артикула!\nОтсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'."
            self.titleFromParsingLabel.label.text = "Не верный формат артикула"
            self.colorFromParsingLabel.label.text = "Отсканируйте выделенный артикул как на фото"
            self.colorFromParsingLabel.label.text = "Отсканируйте выделенный артикул как на фото"
            self.materialFromParsingLabel.label.text = "И повторите попытку!"
            self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
        }
    }
    
    private func scanCodeWithDifferentCount(partsStr: [String], part1: Int, part2: Int) {
        let result = "\(partsStr[part1])\(partsStr[part2])"
        
        resultLabel.label.text = "✅ Артикул: \(result)".trimmingCharacters(in: .whitespacesAndNewlines)
        
        self.urlString = "https://www2.hm.com/en_gb/productpage.\(result).html"
        
        if let urlString = self.urlString {
            networkManager.loadPageFromNetwork(urlString: urlString) { [weak self] result in
                switch result {
                case .success(let htmlContent):
                    self?.parseHTMLContent(htmlContent)
                case .failure(let error):
                    print("Error loading page: \(error)")
                }
            }
        }
    }
    
    private func parseHTMLContent(_ htmlContent: String) {
        let htmlParser = HTMLParser()
        let productResult = htmlParser.parseHTMLContent(htmlContent)
        
        switch productResult {
        case .success(let product):
            self.updateUIWithProduct(product)
        case .failure(let error):
            print("Error parsing HTML content: \(error)")
        }
    }
    
    private func updateUIWithProduct(_ product: Product) {
        if let imageURLString = product.imageURL,
           let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if let error = error {
                    print("Error loading image: \(error)")
                    return
                }
                
                guard let imageData = data else {
                    print("No image data received")
                    return
                }
                
                DispatchQueue.main.async {
                    self.stopSkeleton()
                    self.colorFromParsingLabel.label.isHidden = false
                    self.materialFromParsingLabel.label.isHidden = false
                    self.titleFromParsingLabel.label.text = product.title
                    self.colorFromParsingLabel.label.text = product.colorName
                    self.materialFromParsingLabel.label.text = product.material
                    self.miniatureImageHM.imageView.image = UIImage(data: imageData)
                    
                    self.productObj = Product()
                    self.productObj?.id = UUID()
                    self.productObj?.imageURL = product.imageURL
                    self.productObj?.mainImageURL = product.mainImageURL
                    self.productObj?.link = product.link
                    self.productObj?.article = product.article
                    self.productObj?.title = product.title
                    self.productObj?.price = product.price
                    self.productObj?.colorName = product.colorName
                    self.productObj?.descriptions = product.descriptions
                    self.productObj?.category = product.category
                    self.productObj?.material = product.material
                    self.productObj?.gender = product.gender
                    self.productObj?.babyGender = product.babyGender
                    self.productObj?.addedAt = Date()
                }
            }.resume()
        } else {
            DispatchQueue.main.async {
                self.titleFromParsingLabel.label.text = "Артикул определен, но данный товар отсутствует на сайте H&M!"
                self.colorFromParsingLabel.label.isHidden = true
                self.materialFromParsingLabel.label.isHidden = true
                self.stopSkeleton()
                self.miniatureImageHM.imageView.image = UIImage(systemName: "exclamationmark.icloud.fill")
            }
        }
    }
}
