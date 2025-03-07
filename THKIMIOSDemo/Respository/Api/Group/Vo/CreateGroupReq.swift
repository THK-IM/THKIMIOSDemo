//
//  CreateGroupReq.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

class CreateGroupReq: Codable {
    
    var name: String
    var introduce: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case avatar = "avatar"
        case introduce = "introduce"
    }
    
    init(name: String, introduce: String, avatar: String) {
        self.name = name
        self.introduce = introduce
        self.avatar = avatar
    }
}

