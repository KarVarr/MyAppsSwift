//
//  ButtonsFuncSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 29.06.2024.
//

import UIKit


extension ScanVC {
    
    func alertForDeleteAll() {
        let ac = UIAlertController(title: "Внимание", message: "Вы хотите удалить все сохраненные артикулы?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            self.dataManager.allProducts.removeAll()
        }
        let cancelAlert = UIAlertAction(title: "Отмена", style: .cancel)
        ac.addAction(okAction)
        ac.addAction(cancelAlert)
        present(ac, animated: true)
    }
    
    //MARK: - Delete all
    @objc func deleteAllButton() {
       alertForDeleteAll()
    }
    
    //MARK: - New SCAN
    @objc func newScan() {
        notificationGenerator.notificationOccurred(.success)
        startScanning()
    }
    
    //MARK: - Save ONE
    @objc func saveOneProductResult() {
        print("saveResult")
        
        guard let productObj = self.productObj else {
            print("Error: productObj is nil")
            return
        }
        notificationGenerator.notificationOccurred(.success)
        
        // Проверяем, существует ли продукт в массиве
        let productExists = dataManager.productList.contains { $0.article == productObj.article }
        
        // Обновляем свойства кнопки в зависимости от того, существует ли продукт
        if productExists {
            saveOneProductButtonForScanner.button.configuration?.baseBackgroundColor = .green
            saveOneProductButtonForScanner.button.configuration?.title = "Добавлено"
            saveOneProductButtonForScanner.button.configuration?.image = UIImage(systemName: "checkmark.circle.fill")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.saveOneProductButtonForScanner.button.configuration?.baseBackgroundColor = .blue
                self.saveOneProductButtonForScanner.button.configuration?.title = "Добавить"
                self.saveOneProductButtonForScanner.button.configuration?.image = UIImage(systemName: "plus.circle.fill")
            }
        } else {
            saveOneProductButtonForScanner.button.configuration?.baseBackgroundColor = .blue
            saveOneProductButtonForScanner.button.configuration?.title = "Добавить"
            saveOneProductButtonForScanner.button.configuration?.image = UIImage(systemName: "plus.circle.fill")
            miniatureImageHM.imageView.image = UIImage(systemName: "square.and.arrow.down")
            
            self.miniatureImageHM.imageView.addSymbolEffect(.bounce, animated: true)
            self.miniatureImageHM.imageView.tintColor = .greenSea
            self.miniatureImageHM.imageView.clipsToBounds = false
            self.titleFromParsingLabel.label.text = "Добавленно!"
            self.colorFromParsingLabel.label.isHidden = true
            self.materialFromParsingLabel.label.isHidden = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                self.miniatureImageHM.imageView.image = UIImage(systemName: "barcode.viewfinder")
                self.miniatureImageHM.imageView.addSymbolEffect(.pulse, animated: true)
                self.miniatureImageHM.imageView.tintColor = .systemTeal
                self.miniatureImageHM.imageView.clipsToBounds = false
                self.titleFromParsingLabel.label.text = "Поиск нового артикула..."
            }
            // Если продукт не существует, добавляем его в массив
            dataManager.saveProduct(product: productObj)
            dataManager.productList.append(productObj)
        }
        
        self.showCountOfProductsInArray.label.text = String(dataManager.productList.count)
        self.productObj = nil
        customTableViewScanVC.table.reloadData()
    }
    
    //MARK: - Save ALL
    @objc func saveAllResult() {
        guard !dataManager.productList.isEmpty else {
            print("No products to save")
            return
        }
        notificationGenerator.notificationOccurred(.success)
        
        let countProductsArray = dataManager.productList.count
        
        DispatchQueue.main.async {
            self.miniatureImageHM.imageView.image = UIImage(systemName: "checkmark.circle")
            self.miniatureImageHM.imageView.addSymbolEffect(.bounce, animated: true)
            self.miniatureImageHM.imageView.tintColor = .green
            self.miniatureImageHM.imageView.clipsToBounds = false
            
            self.colorFromParsingLabel.label.isHidden = false
            self.materialFromParsingLabel.label.isHidden = false
            
            let ending: String
            let lastDigit = countProductsArray % 10
            let lastTwoDigits = countProductsArray % 100
            
            if lastTwoDigits >= 11 && lastTwoDigits <= 14 {
                ending = "артикулов"
            } else {
                switch lastDigit {
                case 1:
                    ending = "артикул."
                case 2, 3, 4:
                    ending = "артикула."
                default:
                    ending = "артикулов."
                }
            }
            
            self.titleFromParsingLabel.label.text = "Все отсканированные артикулы сохранены!"
            self.colorFromParsingLabel.label.text = "Закройте экран сканирования потянув вниз ↓"
            self.materialFromParsingLabel.label.text = "Вы отсканировали \(countProductsArray) \(ending)"
        }
        
        dataManager.allProducts.append(dataManager.productList)
        dataManager.saveAllProducts(dataManager.allProducts)
        
        dataManager.productList.removeAll()
        customTableViewScanVC.table.reloadData()
        self.showCountOfProductsInArray.label.text = String(dataManager.productList.count)
    }
}
