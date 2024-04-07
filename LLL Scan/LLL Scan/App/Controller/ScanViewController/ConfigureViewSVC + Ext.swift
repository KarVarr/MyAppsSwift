//
//  ConfigureViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

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
        
        let parts = text.transcript.components(separatedBy: " ")
        if parts.count == 4 {
            let result = "\(parts[1])\(parts[2])"
            print("Result article : \(result)")
            resultLabel.label.text = "✅ Артикул: \(result)"
            
            // Обновление urlString после получения артикула
            self.urlString = "https://www2.hm.com/pl_pl/productpage.\(result).html"
            
            // Выполнение запроса с обновленным urlString
            if let urlString = self.urlString {
                networkManager.loadPageFromNetwork(urlString: urlString) { result in
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
                                        self.miniatureImageHM.imageView.image = UIImage(data: imageData)
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
        } else {
            print("Error: Not such code")
            resultLabel.label.text = "❌ Не верный формат артикула!\nОтсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'."
            DispatchQueue.main.async {
                self.miniatureImageHM.imageView.image = UIImage(named: "HMImg")
            }
        }
    }
    
}


