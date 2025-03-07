//
//  SessionTabViewController.swift
//  THKIMDemo
//
//  Created by vizoss on 2025/3/7.
//  Copyright © 2024 THK. All rights reserved.
//

import UIKit
import THKIMSDK

class SessionTabViewController: IMSessionViewController {

    override func title() -> String? {
        return "Message"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hex: "#EEEEEE")
    }

}
