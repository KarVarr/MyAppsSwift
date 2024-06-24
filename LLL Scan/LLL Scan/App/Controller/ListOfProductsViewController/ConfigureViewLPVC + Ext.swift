//
//  ConfigureViewLPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit
import xlsxwriter

extension ListOfProductsVC {
    override func configureView() {
        view.backgroundColor = .lightGray
        title = "Карточки товара"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let convertFileToCSVButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up.fill"), style: .plain, target: self, action: #selector(shareButtonToConvertFile))
        navigationItem.rightBarButtonItem = convertFileToCSVButton
    }
    
    
    @objc func shareButtonToConvertFile() {
        print("Convert file to XLSX")
        
        guard let productListIndex = productListIndex else {
            print("productListIndex is nil")
            return
        }
        
        let productsContainer = dataManager.allProducts[productListIndex]
        
        // Создание нового XLSX файла
        let tempDirectory = NSTemporaryDirectory()
        let fileName = "Products.xlsx"
        let tempPath = NSURL(fileURLWithPath: tempDirectory).appendingPathComponent(fileName)
        
        
        let document = Workbook(name: tempPath!.path)
        let sheet = document.addWorksheet(name: "Products")
        
        // Добавление заголовков
        sheet.write("Article", [0, 0])
        sheet.write("Title", [0, 1])
        sheet.write("Price", [0, 2])
        sheet.write("Color", [0, 3])
        sheet.write("Description", [0, 4])
        sheet.write("Material", [0, 5])
        sheet.write("Link", [0, 6])
        sheet.write("ImageLink", [0, 7])
        
        // Добавление данных
        var row = 1
        for product in productsContainer {
            sheet.write(.string(product.article ?? ""), [row, 0])
            sheet.write(.string(product.title ?? ""), [row, 1])
            sheet.write(.string(product.price ?? ""), [row, 2])
            sheet.write(.string(product.colorName ?? ""), [row, 3])
            sheet.write(.string(product.descriptions ?? ""), [row, 4])
            sheet.write(.string(product.material ?? ""), [row, 5])
            sheet.write(.string("https://www2.hm.com\(product.link ?? "")"), [row, 6])
            sheet.write(.string("https:\(product.mainImageURL  ?? "")"), [row, 7])
            
            row += 1
        }
        
        // Закрытие и сохранение документа
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




