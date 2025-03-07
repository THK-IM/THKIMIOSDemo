//
//  QueryJoinGroupsRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

import Foundation

class QueryJoinGroupsRes: Codable {

    let total: Int
    let data: [GroupVo]
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case data = "data"
    }

}

