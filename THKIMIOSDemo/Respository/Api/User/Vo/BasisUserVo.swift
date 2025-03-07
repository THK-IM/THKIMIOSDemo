//
//  UserBasicInfoVo.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import THKIMSDK

class BasisUserVo: NSObject, Codable {
    var id: Int64 = 0
    var displayId: String
    var vipLevel: Int
    var nickname: String?
    var avatar: String?
    var sex: Int8?
    var isAuth: Int?
    var bgUrl: String?
    var signature: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case displayId = "display_id"
        case nickname = "nickname"
        case avatar = "avatar"
        case sex = "sex"
        case vipLevel = "vip_level"
        case isAuth = "is_auth"
        case bgUrl = "bg_url"
        case signature = "signature"
    }
    
    init(id: Int64, displayId: String, vipLevel: Int, nickname: String? = nil, avatar: String? = nil, sex: Int8? = nil, isAuth: Int? = nil, bgUrl: String? = nil, signature: String? = nil) {
        self.id = id
        self.displayId = displayId
        self.vipLevel = vipLevel
        self.nickname = nickname
        self.avatar = avatar
        self.sex = sex
        self.isAuth = isAuth
        self.bgUrl = bgUrl
        self.signature = signature
    }
    
    func toUser() -> User {
        let now = IMCoreManager.shared.commonModule.getSeverTime()
        return User(
            id: id, displayId: displayId, nickname: nickname ?? "",
            avatar: avatar, sex: sex, status: 0, extData: nil, cTime: now, mTime: now
        )
    }
    
    public static func fromUser(user: User) -> BasisUserVo {
        let basisUser = BasisUserVo(
            id: user.id, displayId: user.displayId, vipLevel: 0,
            nickname: user.nickname, avatar: user.avatar, sex: user.sex
        )
        return basisUser
    }
    
}
