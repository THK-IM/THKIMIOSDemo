//
//  LeaveGroupReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class LeaveGroupReq: Codable {
    
    var id: Int64
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
    init(id: Int64) {
        self.id = id
    }
    
}

