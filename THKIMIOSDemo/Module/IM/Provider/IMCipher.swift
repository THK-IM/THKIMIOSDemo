//
//  IMCipher.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import THKIMSDK

class IMCipher: Crypto {

    var aes: AESPK7Coder?

    init() {
        self.aes = try? AESPK7Coder(key: "1234123412341234", iv: "0000000000000000")
    }

    func encrypt(_ text: String) -> String? {
        return try? aes?.encrypt(text: text)
    }

    func decrypt(_ cipherText: String) -> String? {
        return try? aes?.decrypt(text: cipherText)
    }

}
