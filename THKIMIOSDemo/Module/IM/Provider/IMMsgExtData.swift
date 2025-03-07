//
//  IMMsgExtData.swift
//  sirius-ios
//
//  Created by think on 2025/1/31.
//

class IMMsgExtData: Codable {
    
    var translatedText: String?
    
    enum CodingKeys: String, CodingKey {
        case translatedText = "translated_text"
    }
    
    init(translatedText: String? = nil) {
        self.translatedText = translatedText
    }
}

