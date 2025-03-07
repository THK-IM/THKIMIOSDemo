//
//  PostReviewGroupApplyReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class PostReviewGroupApplyReq: Codable {

    var applyId: Int64
    var passed: Int

    enum CodingKeys: String, CodingKey {
        case applyId = "apply_id"
        case passed = "passed"
    }

    init(applyId: Int64, passed: Int) {
        self.applyId = applyId
        self.passed = passed
    }

}
