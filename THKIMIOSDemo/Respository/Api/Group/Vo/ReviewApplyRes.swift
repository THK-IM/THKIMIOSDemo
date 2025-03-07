//
//  ReviewApplyRes.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

import Foundation

class ReviewApplyRes: Codable {

    let applyCount: Int64

    enum CodingKeys: String, CodingKey {
        case applyCount = "apply_count"
    }
}
