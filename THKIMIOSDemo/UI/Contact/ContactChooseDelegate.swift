//
//  ContactChooseDelegate.swift
//  THKIMDemo
//
//  Created by vizoss on 2025/3/7.
//  Copyright © 2024 THK. All rights reserved.
//

import Foundation

public protocol ContactChooseDelegate: AnyObject {

    func onContactChoose(ids: Set<Int64>)

}
