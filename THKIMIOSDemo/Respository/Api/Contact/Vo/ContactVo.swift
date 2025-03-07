//
//  ContactVo.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//


import Foundation
import THKIMSDK

class ContactVo: Codable {

    let id: Int64
    let sessionId: Int64?
    let relation: Int
    let noteName: String?
    let nickname: String
    let avatar: String
    let sex: Int
    let createTime: Int64
    let updateTime: Int64

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case sessionId = "session_id"
        case relation = "relation"
        case noteName = "note_name"
        case nickname = "nickname"
        case avatar = "avatar"
        case sex = "sex"
        case createTime = "create_time"
        case updateTime = "update_time"
    }

    func toContact() -> Contact {
        return Contact(
            id: id, sessionId: sessionId, noteName: noteName, relation: relation,
            extData: nil, cTime: createTime, mTime: updateTime
        )
    }

}
