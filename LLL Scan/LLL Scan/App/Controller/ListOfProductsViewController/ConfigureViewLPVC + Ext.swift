//
//  ConfigureViewLPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit
import xlsxwriter
import GoogleTranslateSwift

extension ListOfProductsVC {
    override func configureView() {
        view.backgroundColor = .lightGray
        title = titleForProduct
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let convertFileToCSVButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill"), style: .plain, target: self, action: #selector(shareButtonToConvertFile))
        navigationItem.rightBarButtonItem = convertFileToCSVButton
    }
    
    
    @objc func shareButtonToConvertFile() {
        guard let productListIndex = productListIndex else {
            print("productListIndex is nil")
            return
        }
        
        let productsContainer = dataManager.allProducts[productListIndex]
        
        // Создание нового XLSX файла
        let tempDirectory = NSTemporaryDirectory()
        let fileName = "Products HM \(Helper.Dates.formatDate(Date())).xlsx".replacingOccurrences(of: ":", with: "-")
        let tempPath = NSURL(fileURLWithPath: tempDirectory).appendingPathComponent(fileName)
        
        let document = Workbook(name: tempPath!.path)
        let sheet = document.addWorksheet(name: "Products")
        
        // заголовки
        sheet.write("Article", [0, 0])
        sheet.write("Title", [0, 1])
        sheet.write("Price", [0, 2])
        sheet.write("Color", [0, 3])
        sheet.write("Category", [0, 4])
        sheet.write("Description", [0, 5])
        sheet.write("Material", [0, 6])
        sheet.write("Link", [0, 7])
        sheet.write("ImageLink", [0, 8])
        
        let translateService = GoogleTranslateApiService(apiKey: Keys.googleTranslateAPIKey)
        let googleTranslateService = GoogleTranslateService()
        let group = DispatchGroup()
        
        var row = 1
        for product in productsContainer {
            group.enter()
            
            googleTranslateService.translateProduct(product, with: translateService) { translatedProduct in
                DispatchQueue.main.async {
                    
                    sheet.write(.string(product.article ?? ""), [row, 0])
                    sheet.write(.string(translatedProduct.title ?? ""), [row, 1])
                    sheet.write(.string(product.price ?? ""), [row, 2])
                    sheet.write(.string(translatedProduct.colorName ?? ""), [row, 3])
                    sheet.write(.string(translatedProduct.category ?? ""), [row, 4])
                    sheet.write(.string(product.descriptions ?? ""), [row, 5])
                    sheet.write(.string(translatedProduct.material ?? ""), [row, 6])
                    sheet.write(.string(product.link ?? ""), [row, 7])
                    sheet.write(.string(product.mainImageURL ?? ""), [row, 8])
                    
                    row += 1
                    group.leave()
                }
            }
        }
        
        // Закрытие и сохранение документа
        group.notify(queue: .main) {
            document.close()
            
            // Проверка существования файла и его передача через UIActivityViewController
            if FileManager.default.fileExists(atPath: tempPath!.path) {
                let fileURL = URL(fileURLWithPath: tempPath!.path)
                let exportSheet = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
                self.present(exportSheet, animated: true)
            } else {
                print("Error: File could not be saved")
            }
        }
    }
}

