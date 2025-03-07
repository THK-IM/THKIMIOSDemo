//
//  QueryContactListRsp.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//


import Foundation

class QueryContactListRsp: Codable {

    let total: Int
    let data: [ContactVo]

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case data = "data"
    }

}
