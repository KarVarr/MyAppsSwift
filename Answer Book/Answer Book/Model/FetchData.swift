//
//  FetchData.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import Foundation

struct FetchData {
    func decodeAPI(completion: @escaping (Answer) -> Void) {
        guard let url = URL(string: "https://www.eightballapi.com/api") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let answer = try JSONDecoder().decode(Answer.self, from: data)
                    completion(answer)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

