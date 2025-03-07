//
//  QueryJoinGroupApplyRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class QueryJoinGroupApplyRes: Codable {

    var apply: GroupMemberApplyVo

    enum CodingKeys: String, CodingKey {
        case apply = "apply"
    }

}
