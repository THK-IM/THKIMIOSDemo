//
//  QueryGroupsRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class QueryGroupsRes: Codable {
    
    var groups: Array<GroupVo>
    
    enum CodingKeys: String, CodingKey {
        case groups = "groups"
    }
    
}
