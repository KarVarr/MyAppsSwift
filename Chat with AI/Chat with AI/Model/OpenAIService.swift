//
//  OpenAIService.swift
//  Chat with AI
//
//  Created by Karen Vardanian on 11.05.2023.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endpointUrl = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async ->  OpenAIChatResponse? {
        
        let openAIMessages = messages.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        
        let body = OpenAIChatBody(model: "gpt-3.5-turbo", messages: openAIMessages)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Keys.openAIKey)"
        ]
        
        return try? await AF.request(endpointUrl, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value
    }
}


struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}

struct OpenAIChatResponse: Decodable {
    let choices: [openAIChatChoice]
}

struct openAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}


