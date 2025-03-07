//
//  CreateGroupRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

import Foundation

class CreateGroupRes: Codable {

    let group: GroupVo

    enum CodingKeys: String, CodingKey {
        case group = "group"
    }

}
