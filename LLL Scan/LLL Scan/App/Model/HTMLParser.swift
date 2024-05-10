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
    //
    //    func extractCategoryAndSize(from input: String) -> String? {
    //        // Паттерн для поиска категории и размера
    ////        let pattern = #"Dziecko (Chłopcy|Dziewczynki) ([0-9–]+[ -][0-9–]+ L)"#
    //        let pattern = #"Dziecko (Chłopcy|Dziewczynki) ([0-9]|1[0-4])[-–]([0-9]|1[0-4]) L"#
    //
    //
    //
    //        // Создание регулярного выражения
    //        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
    //            return nil
    //        }
    //
    //        // Поиск совпадений
    //        guard let match = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count)) else {
    //            return nil
    //        }
    //
    //        // Получение результатов
    //        let categoryRange = Range(match.range(at: 1), in: input)!
    //        let sizeRange = Range(match.range(at: 2), in: input)!
    //
    //        let category = String(input[categoryRange])
    //        let size = String(input[sizeRange])
    //
    //        return "\(category) \(size)"
    //    }
    
    
    func extractCategoryAndSize(from input: String) -> String? {
        switch input {
        case _ where input.contains("Chłopcy") && input.contains("9–14 L"):
            return "«Мальчики 9–14 лет»"
        case _ where input.contains("Chłopcy") && input.contains("2-8 L"):
            return "«Мальчики 2-8 лет"
        case _ where input.contains("Dziewczynki") && input.contains("9–14 L"):
            return "Девочки 9–14 лет"
        case _ where input.contains("Dziewczynki") && input.contains("2-8 L"):
            return "Девочки 2-8 лет"
        case _ where input.contains("Chłopcy") && input.contains("Niemowlę"):
            return "Мальчик"
        case _ where input.contains("Dziewczynki") && input.contains("Niemowlę"):
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
            
            let genderElement = try body.select("hm-breadcrumbs li:nth-of-type(2)").first()
            let gender = try genderElement?.select("a").first()?.text()
            print("Gender: \(gender ?? "N/A")")
            
            
            let babyGenderElement = try body.select("hm-breadcrumbs nav ol").first()
            let babyGender = try babyGenderElement?.text() ?? ""
            print("BABY: \(babyGender)")
            if let category = extractCategoryAndSize(from: babyGender) {
                print("Baby gender: \(category)")
            }
            
            
            let product = Product(imageURL: imgSrc, link: link, article: article, title: title, price: price, colorID: colorName, description: description, material: material, fullBlock: nil, addedAt: nil)
            return .success(product)
        } catch  {
            return .failure(error)
        }
    }
}

