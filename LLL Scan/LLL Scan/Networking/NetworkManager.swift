//
//  NetworkManager.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

class NetworkManager {
    func loadPageFromNetwork(urlString: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data, let htmlContent = String(data: data, encoding: .utf8) else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(htmlContent))
        }
        task.resume()
    }
}
