//
//  QueryJoinGroupAppliesRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

import Foundation

class QueryJoinGroupAppliesRes: Codable {

    let applies: [GroupMemberApplyVo]

    enum CodingKeys: String, CodingKey {
        case applies = "applies"
    }

}
