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
                guard let body = doc.body() else { return }
                
                let linkElement = try body.select(".filter-option").first()
                let link = try linkElement?.attr("href")
                print("link: \(link ?? "N/A")")
                
                let articleElement = try body.select(".filter-option").first()
                let article = try articleElement?.attr("data-articlecode")
                print("Article: \(article ?? "N/A")")
                
                let titleElement = try body.select("h1").first()
                let title = try titleElement?.text()
                print("Title: \(title ?? "N/A")")
                
                let priceElement = try body.select(".price").first()
                let price = try priceElement?.text()
                print("Price: \(price ?? "N/A")")
                
                let colorElement = try body.select(".filter-option").first()
                let colorID = try colorElement?.attr("data-color")
                print("ColorID: \(colorID ?? "N/A")")

                let descriptionElement = try body.select("#section-descriptionAccordion").first()
                let description = try descriptionElement?.text()
                print("Description: \(description ?? "N/A")")
                
                let materialElement = try body.select("#section-materialsAndSuppliersAccordion").first()
                let material = try materialElement?.text()
                print("Material: \(material ?? "N/A")")
                
                let fullBlockElement = try body.select(".product-description").first()
                let fullBlock = try fullBlockElement?.text()
                print("Full Block: \(fullBlock ?? "N/A")")
                
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

