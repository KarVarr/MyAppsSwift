//
//  DataFetcher.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import Foundation

enum DataFetchError: Error {
    case invalidURL
    case noData
}

struct DataFetcher {
    func decodeAPI<T: Decodable>(at urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(DataFetchError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(DataFetchError.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}



