//
//  QueryGroupRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class QueryGroupRes: Codable {
    
    var group: GroupVo
    
    enum CodingKeys: String, CodingKey {
        case group = "group"
    }
    
}
