//
//  KickoffGroupMemberReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class KickoffGroupMemberReq: Codable {
    
    var id: Int64
    var kickUserId: Int64
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case kickUserId = "kick_user_id"
    }
    
    init(id: Int64, kickUserId: Int64) {
        self.id = id
        self.kickUserId = kickUserId
    }
}
