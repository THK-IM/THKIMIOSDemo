//
//  BlacklistVo.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class BlacklistVo: Codable {

    let uId: Int64
    let contactId: Int64

    enum CodingKeys: String, CodingKey {
        case uId = "u_id"
        case contactId = "contact_id"
    }

    init(uId: Int64, contactId: Int64) {
        self.uId = uId
        self.contactId = contactId
    }
}
