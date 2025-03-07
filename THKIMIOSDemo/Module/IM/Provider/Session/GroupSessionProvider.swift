//
//  GroupSessionProvider.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//


import THKIMSDK

class GroupSessionProvider: IMBaseSessionCellProvider {
    
    override func sessionType() -> Int {
        return SessionType.Group.rawValue
    }
    
    override func viewCell() -> IMBaseSessionCell {
        return GroupSessionCell(style: .default, reuseIdentifier: self.identifier())
    }
}

