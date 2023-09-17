//
//  FetchData.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import Foundation

struct FetchData {
    func decodeAPI<T: Decodable>(at urlString: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}

