//
//  GroupVo.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import THKIMSDK

class GroupVo: Codable {

    var id: Int64
    var displayId: String
    var sessionId: Int64
    var ownerId: Int64
    var name: String
    var announce: String
    var introduce: String
    var avatar: String
    var memberCount: Int
    let topic: String?
    var enterFlag: Int // 0 随意进群，1 申请通过后可以进入
    var extData: String?
    let onlineCount: Int64?
    var applyCount: Int64?
    var createTime: Int64
    var updateTime: Int64
    var recommendReason1: String?
    var recommendReason2: String?
    var creator: BasisUserVo?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case displayId = "display_id"
        case sessionId = "session_id"
        case ownerId = "owner_id"
        case name = "name"
        case announce = "announce"
        case introduce = "introduce"
        case avatar = "avatar"
        case topic = "topic"
        case memberCount = "member_count"
        case enterFlag = "enter_flag"
        case onlineCount = "online_count"
        case applyCount = "apply_count"
        case extData = "ext_data"
        case createTime = "create_time"
        case updateTime = "update_time"
        case recommendReason1 = "recommend_reason_1"
        case recommendReason2 = "recommend_reason_2"
        case creator = "creator"
    }

    init(id: Int64, displayId: String, sessionId: Int64, ownerId: Int64, name: String, announce: String, introduce: String, avatar: String, memberCount: Int, topic: String?, enterFlag: Int, extData: String? = nil, onlineCount: Int64?, applyCount: Int64? = nil, createTime: Int64, updateTime: Int64, recommendReason1: String? = nil, recommendReason2: String? = nil, creator: BasisUserVo? = nil) {
        self.id = id
        self.displayId = displayId
        self.sessionId = sessionId
        self.ownerId = ownerId
        self.name = name
        self.announce = announce
        self.introduce = introduce
        self.avatar = avatar
        self.memberCount = memberCount
        self.topic = topic
        self.enterFlag = enterFlag
        self.extData = extData
        self.onlineCount = onlineCount
        self.applyCount = applyCount
        self.createTime = createTime
        self.updateTime = updateTime
        self.recommendReason1 = recommendReason1
        self.recommendReason2 = recommendReason2
        self.creator = creator
    }

    func toGroup() -> Group {
        return Group(
            id: id, displayId: displayId, name: name, sessionId: sessionId,
            ownerId: ownerId,
            avatar: avatar, announce: announce, qrcode: "",
            enterFlag: enterFlag,
            memberCount: memberCount, extData: extData, cTime: createTime,
            mTime: updateTime
        )
    }
}
