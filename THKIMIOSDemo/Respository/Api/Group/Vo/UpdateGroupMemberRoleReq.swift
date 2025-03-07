//
//  UpdateGroupMemberRoleReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

class UpdateGroupMemberRoleReq: Codable {

    let groupId: Int64
    let memberUserId: Int64
    let role: Int

    enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
        case memberUserId = "member_user_id"
        case role = "role"
    }
    
    init(groupId: Int64, memberUserId: Int64, role: Int) {
        self.groupId = groupId
        self.memberUserId = memberUserId
        self.role = role
    }
}
