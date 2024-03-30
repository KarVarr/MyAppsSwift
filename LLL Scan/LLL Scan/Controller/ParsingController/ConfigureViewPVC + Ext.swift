//
//  ConfigureViewPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit
import SwiftSoup

extension ParsingVC {
    override func configureView() {
        let urlString = "https://www2.hm.com/en_us/productpage.1219851001.html"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data, let htmlContent = String(data: data, encoding: .utf8) else {
                print("No data received")
                return
            }
            
            do {
                let doc = try SwiftSoup.parse(htmlContent)
                guard let element = try doc.select("div.delivery-information-wrapper").first() else {
                    print("No title element found")
                    return
                }
                
                let text = try element.text()
                DispatchQueue.main.async {
                    self.labelForHtml.label.text = text
                }
            } catch {
                print("Error parsing HTML: \(error)")
            }
            
        }
        
        task.resume()
    
           
    }
}


