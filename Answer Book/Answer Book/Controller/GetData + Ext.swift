//
//  GetData + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 19.09.2023.
//

import Foundation

extension MainViewController {
    //MARK: - Quotes fetcher
    func fetchQuotes() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.dataFetcher.decodeAPI(at: Helper.URL.quotesUrl) { (result: Result<[Quotes], Error>) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let quotes):
                        quotes.forEach {
                            self?.quoteLabel.label.text = "\"\($0.q)\""
                            self?.authorLabel.label.text = $0.a
                            self?.activityIndicator.indicator.stopAnimating()
                            
                            self?.scheduleNotificationIfNeeded(quotes: quotes)
                        }
                    case .failure(let error):
                        print("Error with Quotes: \(error)")
                        Helper.Alert.showNoInternetAlert(from: self!)
                    }
                    
                }
            }
        }
    }
    //MARK: - Answer fetcher
    func fetchAnswer(completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
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
                    }
                }
                completion()
            }
        }
    }
}
