//
//  ViewModelOpenAI.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 10.05.2023.
//
import OpenAISwift
import SwiftUI

class ViewModelOpenAI: ObservableObject {
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(output)
            case .failure():
                break
            }
        })
    }
}
