//
//  SetNoteNameReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//


import Foundation

class SetNoteNameReq: Codable {

    let uId: Int64
    let contactId: Int64
    let noteName: String

    enum CodingKeys: String, CodingKey {
        case uId = "u_id"
        case contactId = "contact_id"
        case noteName = "note_name"
    }

    init(uId: Int64, contactId: Int64, noteName: String) {
        self.uId = uId
        self.contactId = contactId
        self.noteName = noteName
    }
}
