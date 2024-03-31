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
    let imageForHtml = ImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        configureLabels()
        configureImageView()
        
        loadPageFromNetwork()
    }
    
    
    func loadPageFromNetwork() {
           let urlString = "https://www2.hm.com/de_de/productpage.1213391004.html"
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
            
               self.parseHTMLContent(htmlContent)
           }
           
           task.resume()
       }
    
    func parseHTMLContent(_ htmlContent: String) {
            do {
                let doc = try SwiftSoup.parse(htmlContent)
                guard let body = doc.body() else { return }
                
                let aElement = try body.select("a[class='filter-option miniature active']").first()
                let imgElement = try aElement?.select("img").first()
                let imgSrc = try imgElement?.attr("src")
                print("Image src: \(imgSrc ?? "N/A")")
                
                let linkElement = try body.select("a[class='filter-option miniature active']").first()
                let link = try linkElement?.attr("href")
                print("link: \(link ?? "N/A")")
                
                let articleElement = try body.select("a[class='filter-option miniature active']").first()
                let article = try articleElement?.attr("data-articlecode")
                print("Article: \(article ?? "N/A")")
                
                let titleElement = try body.select("h1").first()
                let title = try titleElement?.text()
                print("Title: \(title ?? "N/A")")
                
                let priceElement = try body.select(".price").first()
                let price = try priceElement?.text()
                print("Price: \(price ?? "N/A")")
                
                let colorElement = try body.select("a[class='filter-option miniature active']").first()
                let colorID = try colorElement?.select("img").first()
                let colorName = try colorID?.attr("alt")
                //                let colorID = try colorElement?.attr("data-color")
                print("ColorID: \(colorName ?? "N/A")")

                let descriptionElement = try body.select("#section-descriptionAccordion").first()
                let description = try descriptionElement?.select("p").first()?.text()
                print("Description: \(description ?? "N/A")")

                let materialElement = try body.select("#section-materialsAndSuppliersAccordion").first()
                let material = try materialElement?.select("ul").first()?.text()
                print("Material: \(material ?? "N/A")")
                
                let fullBlockElement = try body.select(".product-description").first()
                let fullBlock = try fullBlockElement?.text()
                print("Full Block: \(fullBlock ?? "N/A")")
                
                
            } catch {
                print("Error parsing HTML: \(error)")
            }
        }
    
}

