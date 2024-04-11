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
        
        title = "Scan"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func newScan() {
        guard scannerAvailable == true else {
            print(" Error: Scanner is not available for usage. Please check settings")
            return
        }
        
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.text()],
                                                    isHighFrameRateTrackingEnabled: true,
                                                    isPinchToZoomEnabled: true,
                                                    isHighlightingEnabled: true
        )
        dataScanner.delegate = self
        
        dataScanner.view.addSubview(overlayViewForScanner.vc)
        
        NSLayoutConstraint.activate([
            overlayViewForScanner.vc.leadingAnchor.constraint(equalTo: dataScanner.view.leadingAnchor),
            overlayViewForScanner.vc.trailingAnchor.constraint(equalTo: dataScanner.view.trailingAnchor),
            overlayViewForScanner.vc.topAnchor.constraint(equalTo: dataScanner.view.topAnchor),
            overlayViewForScanner.vc.heightAnchor.constraint(equalTo: dataScanner.view.heightAnchor, multiplier: 0.4)
        ])
        
        
        present(dataScanner, animated: true)
        try? dataScanner.startScanning()
    }
    
    @objc func saveResult() {
        print("saveResult")
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
                    self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
                }
            }
        } else {
            DispatchQueue.main.async {
                self.resultLabel.label.text = "❌ \(text.transcript) Не верный формат артикула!\nОтсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'."
                self.titleFromParsingLabel.label.text = "Не верный формат артикула"
                self.colorFromParsingLabel.label.text = "Отсканируйте ариткул как на фото →"
                self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
            }
            print("non valid regex art")
        }
    }
    
    
    private func scanCodeWithDifferentCount(partsStr: [String], part1: Int, part2: Int) {
        let result = "\(partsStr[part1])\(partsStr[part2])"
        print("Result article : \(result)")
        resultLabel.label.text = "✅ Артикул: \(result)"
        
        // Обновление urlString после получения артикула
        self.urlString = "https://www2.hm.com/pl_pl/productpage.\(result).html"
        
        // Выполнение запроса с обновленным urlString
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
                            URLSession.shared.dataTask(with: imageURL) {data, response, error in
                                print(imageURL)
                                if let error = error {
                                    print("Error loading image: \(error)")
                                    return
                                }
                                guard let imageData = data else {
                                    print("No image data received")
                                    return
                                }
                                DispatchQueue.main.async {
                                    self?.titleFromParsingLabel.label.text = product.title
                                    self?.colorFromParsingLabel.label.text = product.colorID
                                    self?.miniatureImageHM.imageView.image = UIImage(data: imageData)
                                }
                            }.resume()
                        } else {
                            print("Invalid image URL")
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
}


