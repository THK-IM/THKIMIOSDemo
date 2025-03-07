//
//  ContactSummaryVo.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//


import Foundation

class ContactSummaryVo: Codable {

    let followCount: Int64
    let beFollowCount: Int64

    enum CodingKeys: String, CodingKey {
        case followCount = "follow_count"
        case beFollowCount = "be_follow_count"
    }
}
