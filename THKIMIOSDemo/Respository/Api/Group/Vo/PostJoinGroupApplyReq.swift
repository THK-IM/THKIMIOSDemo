//
//  PostJoinGroupApplyReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class PostJoinGroupApplyReq: Codable {
    
    var groupId: Int64
    var applyContent: String
    
    enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
        case applyContent = "apply_content"
    }
    
    init(groupId: Int64, applyContent: String) {
        self.groupId = groupId
        self.applyContent = applyContent
    }
}
