//
//  GroupMemberApplyVo.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class GroupMemberApplyVo: Codable {
    var id: Int64
    var applyUser: BasisUserVo
    var groupId: Int64
    var groupName: String
    var applyContent: String
    var reviewStatus: Int
    var createTime: Int64
    var updateTime: Int64
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case groupId = "group_id"
        case groupName = "group_name"
        case applyContent = "apply_content"
        case applyUser = "apply_user"
        case reviewStatus = "review_status"
        case createTime = "create_time"
        case updateTime = "update_time"
    }
}
