//
//  GetData + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 19.09.2023.
//

import Foundation
import UIKit

extension MainViewController {
    
    func fetchQuotes() {
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            self.dataFetcher.decodeAPI(at: Helper.URL.quotesUrl) { (result: Result<[Quotes], Error>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let quotes):
                        quotes.forEach {
                            self.quoteLabel.label.text = "\"\($0.quotes)\""
                            self.authorLabel.label.text = $0.author
                            self.activityIndicator.indicator.stopAnimating()
                        }
                    case .failure(let error):
                        print("Error with Quotes: \(error)")
                        Helper.Alert.showNoInternetAlert(from: self)
                    }
                    
                }
            }
        }
    }
    
    func fetchAnswer(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            A
            self.dataFetcher.decodeAPI(at: Helper.URL.answerUrl) { (result: Result<Answer, Error>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let answer):
                        self.answerLabel.label.text = answer.reading
                    case .failure(let error):
                        if let dataFetchError = error as? DataFetchError, dataFetchError == .noData {
                            Helper.Alert.showNoInternetAlert(from: self)
                        } else {
                            Helper.Alert.showNoInternetAlert(from: self)
                        }
                        let generate = UINotificationFeedbackGenerator()
                        generate.prepare()
                        generate.notificationOccurred(.error)
                    }
                }
                completion()
            }
        }
    }
}
