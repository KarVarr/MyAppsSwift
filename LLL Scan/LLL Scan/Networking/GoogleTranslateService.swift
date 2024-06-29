//
//  GoogleTranslateService.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 27.06.2024.
//

import Foundation
import GoogleTranslateSwift

struct GoogleTranslateService {
    func translateProduct(_ product: Product, with service: GoogleTranslateApiService, completion: @escaping (Product) -> Void) {
        let translatedProduct = product
        
        let group = DispatchGroup()
        let rus = Locale(identifier: "ru")
        let ger = Locale(identifier: "pl")
        
        group.enter()
        service.translate(product.title ?? "", from: ger, to: rus) { result in
            switch result {
            case .success(let translationResult):
                try? product.realm?.write {
                    translatedProduct.title = translationResult.translations.first?.translatedText
                }
                print("Translated title: \(translatedProduct.title ?? "")")
            case .failure(let error):
                translatedProduct.title = product.title
                print("Error translating title: \(error)")
            }
            group.leave()
        }
        
        group.enter()
        service.translate(product.colorName ?? "", from: ger, to: rus) { result in
            switch result {
            case .success(let translationResult):
                try? product.realm?.write {
                    translatedProduct.colorName = translationResult.translations.first?.translatedText
                }
                print("Translated colorName: \(translatedProduct.colorName ?? "")")
            case .failure(let error):
                translatedProduct.colorName = product.colorName
                print("Error translating colorName: \(error)")
            }
            group.leave()
        }
        
        group.enter()
        service.translate(product.material ?? "", from: ger, to: rus) { result in
            switch result {
            case .success(let translationResult):
                try? product.realm?.write {
                    translatedProduct.material = translationResult.translations.first?.translatedText
                }
                print("Translated material: \(translatedProduct.material ?? "")")
            case .failure(let error):
                print("Error translating material: \(error)")
                translatedProduct.material = product.material
            }
            group.leave()
        }
        
        group.enter()
        service.translate(product.gender ?? "", from: ger, to: rus) { result in
            switch result {
            case .success(let translationResult):
                try? product.realm?.write {
                    translatedProduct.gender = translationResult.translations.first?.translatedText
                }
                print("Translated gender: \(translatedProduct.gender ?? "")")
            case .failure(let error):
                print("Error translating gender: \(error)")
                translatedProduct.gender = product.gender
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            completion(translatedProduct)
        }
    }
}
