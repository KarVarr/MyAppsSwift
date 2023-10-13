//
//  Quotes.swift
//  Answer Book
//
//  Created by Karen Vardanian on 11.10.2023.
//

import UIKit

extension MainViewController {
    //MARK: - Quotes
    func configureQuotesViews() {
        quoteViewBox.viewBox.clipsToBounds = true
        quoteViewBox.viewBox.layer.cornerRadius = 30
        quoteViewBox.viewBox.layer.borderWidth = 1
        quoteViewBox.viewBox.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        
        titleLabel.label.text = Helper.String.quotesTitle
        titleLabel.label.font = Helper.Font.gillSansBold(with: dynamicFontSize(16))
        
        dateLabel.label.text = getCurrentDate()
        dateLabel.label.font = Helper.Font.gillSansBold(with: dynamicFontSize(12))
        dateLabel.label.textColor = .white.withAlphaComponent(0.5)
        
        quoteLabel.label.font = Helper.Font.americanTypewriter(with: dynamicFontSize(20))
        quoteLabel.label.adjustsFontSizeToFitWidth = true
        
        authorLabel.label.font = Helper.Font.snellRoundhand(with: dynamicFontSize(20))
        authorLabel.label.textColor = .white.withAlphaComponent(0.9)
    }
}
