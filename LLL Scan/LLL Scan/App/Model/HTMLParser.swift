//
//  HTMLParser.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import Foundation
import SwiftSoup

enum ParserError: Error {
    case invalidHTML
}

class HTMLParser {
    func parseHTMLContent(_ htmlContent: String) -> Result<Product, Error> {
        do {
            let doc = try SwiftSoup.parse(htmlContent)
            
            guard let body = doc.body() else {
                return .failure(ParserError.invalidHTML)
            }
            
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
            print("ColorID: \(colorName ?? "N/A")")

            let descriptionElement = try body.select("#section-descriptionAccordion").first()
            let description = try descriptionElement?.select("p").first()?.text()
            print("Description: \(description ?? "N/A")")

            let materialElement = try body.select("#section-materialsAndSuppliersAccordion").first()
            let material = try materialElement?.select("ul").first()?.text()
            print("Material: \(material ?? "N/A")")
            
//            let fullBlockElement = try body.select(".product-description").first()
//            let fullBlock = try fullBlockElement?.text()
//            print("Full Block: \(fullBlock ?? "N/A")")
            
            let genderElement = try body.select("hm-breadcrumbs nav ol").first()
            let gender = try genderElement?.select("a").first()?.text()
            print("Gender: \(gender ?? "N/A")")
            
//            let babyGenderElement = try body.select("hm-breadcrumbs li:nth-of-type(4)").first()
//            let babyGender = try babyGenderElement?.select("a").first()?.text()
//            print("Baby gender: \(babyGender ?? "N/A")")
                  
            let product = Product(imageURL: imgSrc, link: link, article: article, title: title, price: price, colorID: colorName, description: description, material: material, fullBlock: nil, addedAt: nil)
            return .success(product)
        } catch  {
            return .failure(error)
        }
    }
}

