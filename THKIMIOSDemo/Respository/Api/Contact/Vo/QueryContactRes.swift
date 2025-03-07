//
//  QueryContactRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class QueryContactRes: Codable {
    let contact: ContactVo

    enum CodingKeys: String, CodingKey {
        case contact = "contact"
    }

}
