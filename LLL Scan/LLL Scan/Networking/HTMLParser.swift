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
            return "---"
        }
    }
    
    func parseHTMLContent(_ htmlContent: String) -> Result<Product, Error> {
        do {
            let doc = try SwiftSoup.parse(htmlContent)
            
            guard let body = doc.body() else {
                return .failure(ParserError.invalidHTML)
            }
            //MARK: - MINI IMG
            let aElement = try body.select("div[class='fcc68c a33b36 f6e252']").first()
            let imgElement = try aElement?.select("img").first()
            let imgSrc = try imgElement?.attr("src").replacingOccurrences(of: "2160", with: "116")
            print("Image src: \(imgSrc ?? "N/A")")
            
            //MARK: - FULLHD MAIN IMG
            let mainImageElement = try body.select("div[class='fcc68c a33b36 f6e252']").first()
            let mainImgElement = try mainImageElement?.select("img").first()
            let mainImgSrc = try mainImgElement?.attr("src")
            print("Main Image src: \(mainImgSrc ?? "N/A")")
            
            //MARK: - ARTICLE
            let articleElement = try body.select("span[class='d1cd7b b7f566 a0f363']").first()
            let article = try articleElement?.text()
            print("Article: \(article ?? "N/A")")
            
            //MARK: - LINK
            let link = "https://www2.hm.com/en_gb/productpage.\(article ?? "00000000").html"
            print("link: \(link)")
            
            //MARK: - TITLE
            let titleElement = try body.select("h1").first()
            let title = try titleElement?.text()
            print("Title: \(title ?? "N/A")")
            
            //MARK: - PRICE
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
            
            //MARK: - COLOR, IMAGE, CATEGORY
            var colorName: String?
            var imageURL: String?
            var category: String?
            
            // Извлечение JSON данных из скрипта
            if let scriptElement = try body.select("script#product-schema").first() {
                let jsonText = try scriptElement.html()
                
                // Парсинг JSON данных
                if let jsonData = jsonText.data(using: .utf8) {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                        
                        // Извлечение цвета
                        if let color = json["color"] as? String {
                            colorName = color
                            print("Color: \(color)")
                        }
                        
                        // Извлечение изображения
                        if let image = json["image"] as? String {
                            imageURL = image
                            print("Image URL: \(image)")
                        }
                        
                        // Извлечение категории
                        if let categoryDict = json["category"] as? [String: Any], let categoryName = categoryDict["name"] as? String {
                            category = categoryName
                            print("Category: \(categoryName)")
                        }
                    }
                }
            }
            //MARK: - DESCRIPTION
            let descriptionElement = try body.select("#section-descriptionAccordion").first()
            let descriptions = try descriptionElement?.select("p").first()?.text()
            print("Description: \(descriptions ?? "N/A")")
            
            //MARK: - MATERIAL
            let materialElement = try body.select("#section-materialsAndSuppliersAccordion").first()
            let material = try materialElement?.select("ul").first()?.text()
            print("Material: \(material ?? "N/A")")
            
            //MARK: - GENDER
            let genderElement = try body.select("nav[class='e0fe54']").first()
            let genderLiElement = try genderElement?.select("li:nth-of-type(2)").first()
            let gender = try genderLiElement?.select("a").first()?.text()
            print("Gender: \(gender ?? "N/A")")
            
            //MARK: - BABY GENDER
            let babyGenderElement = try body.select("nav[class='e0fe54'] ol").first()
            var babyGender = try babyGenderElement?.text() ?? ""
            print("BABY: \(babyGender)")
            
            if let babyGenderCategory = extractCategoryAndSize(from: babyGender) {
                print("Baby gender: \(babyGenderCategory)")
                babyGender = babyGenderCategory
            }
            
            //MARK: - Model Product
            let product = Product()
            product.id = UUID()
            product.imageURL = imageURL
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

