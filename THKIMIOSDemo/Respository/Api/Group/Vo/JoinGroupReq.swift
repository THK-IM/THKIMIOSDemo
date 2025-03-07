//
//  JoinGroupReq.swift
//  sirius-ios
//
//  Created by think on 2025/1/23.
//

class JoinGroupReq: Codable {
    
    let userId: Int64
    let groupId: Int64
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case groupId = "group_id"
    }
    
    init(userId: Int64, groupId: Int64) {
        self.userId = userId
        self.groupId = groupId
    }
}
