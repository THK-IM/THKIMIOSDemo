//
//  UpdateGroupReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

class UpdateGroupReq: Codable {

    let groupId: Int64
    let name: String?
    let avatar: String?
    let introduce: String?
    let functionFlag: Int64?
    let mute: Int?  // SessionMuted 1禁言所有人 2禁言单个人
    let enterFlag: Int?

    enum CodingKeys: String, CodingKey {
        case groupId = "group_id"
        case name = "name"
        case avatar = "avatar"
        case introduce = "introduce"
        case functionFlag = "function_flag"
        case enterFlag = "enter_flag"
        case mute = "mute"
    }

    init(
        groupId: Int64, name: String? = nil, avatar: String? = nil, introduce: String? = nil,
        functionFlag: Int64? = nil, mute: Int? = nil, enterFlag: Int? = nil
    ) {
        self.groupId = groupId
        self.name = name
        self.avatar = avatar
        self.introduce = introduce
        self.functionFlag = functionFlag
        self.mute = mute
        self.enterFlag = enterFlag
    }
}
