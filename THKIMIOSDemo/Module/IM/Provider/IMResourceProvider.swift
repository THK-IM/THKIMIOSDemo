//
//  IMResourceProvider.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import THKIMSDK

class IMResourceProvider: IMUIResourceProvider {
    
    func sessionRowHeight() -> CGFloat {
        return 80
    }
    

    func canAtAll(_ session: THKIMSDK.Session) -> Bool {
        return true
    }

    func supportFunction(_ session: Session, _ functionFlag: Int64) -> Bool {
        return session.functionFlag & functionFlag != 0
    }

    func msgBubble(message: Message, session: Session?) -> UIImage? {
        if message.fromUId == 0 {
            return ImageUtils.drawImage(
                with: [
                    .black.withAlphaComponent(0.3),
                    .black.withAlphaComponent(0.3),
                ],
                size: CGSize(width: 20, height: 20), cornerRadius: 6.0
            )
        } else {
            return ImageUtils.drawImage(
                with: [
                    .white,
                    .white,
                ],
                size: CGSize(width: 40, height: 40), cornerRadius: 7.0
            )
        }
    }

    func tintColor() -> UIColor? {
        return UIColor.init(hex: "FF5580")
    }

    func panelBgColor() -> UIColor? {
        return UIColor.init(hex: "FFFFFF")
    }

    func layoutBgColor() -> UIColor? {
        return UIColor.init(hex: "EEEEEE")
    }

    func inputBgColor() -> UIColor? {
        return UIColor.init(hex: "FFFFFF")
    }

    func inputTextColor() -> UIColor? {
        return UIColor.init(hex: "333333")
    }

    func tipTextColor() -> UIColor? {
        return UIColor.init(hex: "666666")
    }

    private var emojis = [
        "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "🫠", "😉", "😊", "😇",
        "🥰", "😍", "🤩", "😘", "😗", "😚", "😙", "🥲", "😋", "😛", "😜", "🤪", "😝", "🤑",
        "🤗", "🤭", "🫢", "🫣", "🤫", "🤔", "🫡", "😌", "😔", "😪", "🤤", "😴", "😭", "😱",
        "😖", "😣", "😞", "😓", "😩", "😫", "🥱", "😤", "😡", "🤡", "🤖", "😺", "😸", "😹",
        "😻", "😼", "😽", "🙀", "😿", "😾", "💔", "🩷", "💢", "💥", "💫", "💦", "💋", "💤",
        "✅️", "❎️", "👋", "🤚", "🖐️", "✋️", "🖖", "🫱", "🫲", "🫳", "🫴", "🫷", "🫸", "👌",
        "🤌", "🤏", "✌️", "🤞", "🫰", "🤟", "🤘", "🤙", "👈️", "👉️", "👆️", "🖕", "👇️", "☝️",
        "🫵", "👍️", "👎️", "✊️", "👊", "🤛", "🤜", "👏", "🙌", "🫶", "👐", "🤲", "🤝", "🙏",
        "👄", "🫦", "🐵", "🐒", "🦍", "🦧", "🐶", "🐕️", "🦮", "🐕‍🦺", "🐩", "🐺", "🦊", "🦝",
        "🐱", "🐈️", "🐈‍⬛", "🦁", "🐯", "🐅", "🐆", "🐴", "🫎", "🫏", "🐎", "🦄", "🦓", "🦌",
        "🦬", "🐮", "🐂", "🐃", "🐄", "🐷", "🐖", "🐗", "🐽", "🐏", "🐑", "🐐", "🐪", "🐫",
        "🦙", "🦒", "🐘", "🦣", "🦏", "🦛", "🐭", "🐁", "🐀", "🐹", "🐰", "🐇", "🐿️", "🦫",
        "🦔", "🦇", "🐻", "🐻‍❄️", "🐨", "🐼", "🦥", "🦦", "🦨", "🦘", "🦡", "🐾", "🦃", "🐔",
        "🐓", "🐣", "🐤", "🐥", "🐦️", "🐧", "🕊️", "🦅", "🦆", "🦢", "🦉", "🦤", "🪶", "🦩",
        "🦚", "🦜", "🍆", "🌶️",
    ]

    func unicodeEmojis() -> [String]? {
        return emojis
    }

    func avatar(user: User) -> UIImage? {
        return nil
    }

}
