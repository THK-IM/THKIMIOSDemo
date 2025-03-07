//
//  IMCommonModule.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import RxSwift
import THKIMSDK

class IMCommonModule: DefaultCommonModule {

    private let disposeBag = DisposeBag()

    override func beKickOff() {
        super.beKickOff()
    }

    override func onSignalReceived(_ type: Int, _ body: String) {
    }
}
