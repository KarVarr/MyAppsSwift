//
//  ParsingVC.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit
import SwiftSoup

class ParsingVC: BaseViewController {
    let labelForHtml = LabelView()
    let temporaryFileName = "tempPage.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
//        configureLabels()
        
        loadPageFromNetwork()
    }
    
    func getTemporaryPageURL() -> URL? {
        let temporaryDirectory = FileManager.default.temporaryDirectory
        return temporaryDirectory.appendingPathComponent(temporaryFileName)
    }
    
    func loadPageFromNetwork() {
           let urlString = "https://www2.hm.com/en_us/productpage.1219851001.html"
           guard let url = URL(string: urlString) else { return }
           
           let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
               guard let self = self else { return }
               
               if let error = error {
                   print("Error: \(error)")
                   return
               }
               
               guard let data = data, let htmlContent = String(data: data, encoding: .utf8) else {
                   print("No data received")
                   return
               }
               
               // Сохраняем страницу во временное хранилище
               if let temporaryPageURL = self.getTemporaryPageURL() {
                   do {
                       try htmlContent.write(to: temporaryPageURL, atomically: true, encoding: .utf8)
                   } catch {
                       print("Error saving temporary page: \(error)")
                   }
               }
               
               // Парсим HTML-контент
               self.parseHTMLContent(htmlContent)
           }
           
           task.resume()
       }
    
    func parseHTMLContent(_ htmlContent: String) {
            do {
                let doc = try SwiftSoup.parse(htmlContent)
                
                // Ваш код для парсинга и извлечения цены и описания
                // Например:
                let priceElement = try doc.select(".product-price").first()
                let price = try priceElement?.text()
                print("Price: \(price ?? "N/A")")
                
                let descriptionElement = try doc.select(".product-description").first()
                let description = try descriptionElement?.text()
                print("Description: \(description ?? "N/A")")
                
                // Удаление временного файла
                if let temporaryPageURL = self.getTemporaryPageURL() {
                    do {
                        try FileManager.default.removeItem(at: temporaryPageURL)
                    } catch {
                        print("Error removing temporary file: \(error)")
                    }
                }
                
            } catch {
                print("Error parsing HTML: \(error)")
            }
        }
    
}

