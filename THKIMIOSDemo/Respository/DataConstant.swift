//
//  DataConstant.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation

public enum ContactRelation: Int {
    case Stranger = 1
    case
        Black = 2
    case
        BeBlack = 4
    case
        Fellow = 8
    case
        BeFellow = 16
    case
        Friend = 24
}

public enum MemberApplyStatus: Int {
    case Init = 0
    case
        Reject = 1
    case
        Accepted = 2
}
