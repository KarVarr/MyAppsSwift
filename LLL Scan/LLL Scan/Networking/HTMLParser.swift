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
    private func extractCategoryAndSize(from input: String) -> String? {
        switch input {
        case _ where input.contains("Boys") && input.contains("9-14Y"):
            return "Мальчики 9–14 лет"
        case _ where input.contains("Boys") && input.contains("2-8Y"):
            return "Мальчики 2-8 лет"
        case _ where input.contains("Girls") && input.contains("9-14Y"):
            return "Девочки 9–14 лет"
        case _ where input.contains("Girls") && input.contains("2-8Y"):
            return "Девочки 2-8 лет"
        case _ where input.contains("Boys") && input.contains("Baby"):
            return "Мальчик"
        case _ where input.contains("Girls") && input.contains("Baby"):
            return "Девочка"
        default:
            return "Нет данных на сайте"
        }
    }
    
    func parseHTMLContent(_ htmlContent: String) -> Result<Product, Error> {
        do {
            let doc = try SwiftSoup.parse(htmlContent)
            
            guard let body = doc.body() else {
                return .failure(ParserError.invalidHTML)
            }
            
            let aElement = try body.select("div[class='fcc68c a33b36 f6e252']").first()
            let imgElement = try aElement?.select("img").first()
            let imgSrc = try imgElement?.attr("src").replacingOccurrences(of: "2160", with: "116")
            print("Image src: \(imgSrc ?? "N/A")")
            
            let mainImageElement = try body.select("div[class='fcc68c a33b36 f6e252']").first()
            let mainImgElement = try mainImageElement?.select("img").first()
            let mainImgSrc = try mainImgElement?.attr("src")
            print("Main Image src: \(mainImgSrc ?? "N/A")")
            
            let articleElement = try body.select("span[class='d1cd7b b7f566 a0f363']").first()
            let article = try articleElement?.text()
            print("Article: \(article ?? "N/A")")
            
            let link = "https://www2.hm.com/en_gb/productpage.\(article ?? "00000000").html"
            print("link: \(link)")
            
            let titleElement = try body.select("h1").first()
            let title = try titleElement?.text()
            print("Title: \(title ?? "N/A")")
            
            let priceElements = try body.select("div[class='e26896'] span")
            var price: String?
            for priceElement in priceElements {
                let priceClass = try priceElement.className()
                let priceText = try priceElement.text()
                
                if priceClass.contains("e98f30") || priceClass.contains("d9ca8b") {
                    price = priceText
                    break
                }
            }
            
            if price == nil {
                price = try priceElements.first()?.text()
            }
            
            print("Price: \(price ?? "N/A")")
            
            let colorElement = try body.select("div[data-testid='color-selector']").first()
            let colorPElement = try colorElement?.select("p[class='d1cd7b a09145 b97b34']").first()
            let colorName = try colorPElement?.text().replacingOccurrences(of: "-", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
            print("Color: \(colorName ?? "N/A")")
            
            let descriptionElement = try body.select("#section-descriptionAccordion").first()
            let descriptions = try descriptionElement?.select("p").first()?.text()
            print("Description: \(descriptions ?? "N/A")")
            
            let materialElement = try body.select("#section-materialsAndSuppliersAccordion").first()
            let material = try materialElement?.select("ul").first()?.text()
            print("Material: \(material ?? "N/A")")
            
            let genderElement = try body.select("nav li:nth-of-type(2)").first()
            let gender = try genderElement?.select("a").first()?.text()
            print("Gender: \(gender ?? "N/A")")
            
            let babyGenderElement = try body.select("hm-breadcrumbs nav ol").first()
            var babyGender = try babyGenderElement?.text() ?? ""
            print("BABY: \(babyGender)")
            
            if let babyGenderCategory = extractCategoryAndSize(from: babyGender) {
                print("Baby gender: \(babyGenderCategory)")
                babyGender = babyGenderCategory
            }
            
            let product = Product()
            product.id = UUID()
            product.imageURL = imgSrc
            product.mainImageURL = mainImgSrc
            product.link = link
            product.article = article
            product.title = title
            product.price = price
            product.colorName = colorName
            product.descriptions = descriptions
            product.material = material
            product.gender = gender
            product.babyGender = babyGender
            product.addedAt = nil
            
            return .success(product)
        } catch  {
            return .failure(error)
        }
    }
}

