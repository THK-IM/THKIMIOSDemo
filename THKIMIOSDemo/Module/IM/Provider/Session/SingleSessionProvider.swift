//
//  SingleSessionProvider.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/16.
//

import THKIMSDK

class SingleSessionProvider: IMBaseSessionCellProvider {
    
    override func sessionType() -> Int {
        return SessionType.Single.rawValue
    }
    
    override func viewCell() -> IMBaseSessionCell {
        return SingleSessionCell(style: .default, reuseIdentifier: self.identifier())
    }
}
