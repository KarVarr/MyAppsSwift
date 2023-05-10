//
//  ViewModelOpenAI.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 10.05.2023.
//
import OpenAISwift
import SwiftUI

class ViewModelOpenAI: ObservableObject {
    let keys = Keys()
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
            client = OpenAISwift(authToken: keys.openAIKey)
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        guard let client = client else {
            print ("client not work")
            return
        }
        
        client.sendCompletion(with: text,  completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(output)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                break
            }
        })
    }
}
