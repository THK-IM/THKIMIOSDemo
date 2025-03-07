//
//  MuteGroupReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class MuteGroupReq: Codable {
    
    var groupId: Int64
    var muteUserId: Int64? // 禁言用户id
    var mute: Int  // 1 禁言 2 取消禁言
    
    enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
        case muteUserId = "mute_user_id"
        case mute = "mute"
    }
    
    init(groupId: Int64, muteUserId: Int64?, mute: Int) {
        self.groupId = groupId
        self.muteUserId = muteUserId
        self.mute = mute
    }
    
}
