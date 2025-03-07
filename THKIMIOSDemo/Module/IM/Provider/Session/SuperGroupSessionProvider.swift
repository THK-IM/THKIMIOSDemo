//
//  SuperGroupSessionProvider.swift
//  Mars
//
//  Created by zhouwei on 2024/4/26.
//

import THKIMSDK

class SuperGroupSessionProvider: IMBaseSessionCellProvider {

    override func sessionType() -> Int {
        return SessionType.SuperGroup.rawValue
    }

    override func viewCell() -> IMBaseSessionCell {
        return GroupSessionCell(
            style: .default, reuseIdentifier: self.identifier())
    }
}
