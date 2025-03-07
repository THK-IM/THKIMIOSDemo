//
//  QueryUsersRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class QueryUsersRes: Codable {
    
    var users: Dictionary<String, BasisUserVo>
    
    enum CodingKeys: String, CodingKey {
        case users = "users"
    }
    
    init(users: Dictionary<String, BasisUserVo>) {
        self.users = users
    }
}
