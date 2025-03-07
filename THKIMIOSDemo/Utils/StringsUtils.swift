//
//  StringsUtils.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import NaturalLanguage
import Translation
import UIKit
import THKIMSDK

class StringsUtils {

    static func base64String(_ text: String) -> String {
        if let data = text.data(using: .utf8) {
            return data.base64EncodedString(options: .lineLength64Characters)
        }
        return text
    }

    static func isNotEmpty(_ text: String?) -> Bool {
        if text == nil { return false }
        return text!.count != 0
    }

    static func jsonStringToMap(json: String) -> [String: Any]? {
        if let data = json.data(using: .utf8) {
            do {
                if let json = try JSONSerialization.jsonObject(
                    with: data, options: [])
                    as? [String: Any]
                {
                    return json
                } else {
                    print("Error: Unable to convert JSON string to dictionary.")
                    return nil
                }
            } catch {
                print("Error: \(error.localizedDescription)")
                return nil
            }
        }
        return nil
    }

    static func mapToJsonString(map: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(
                withJSONObject: map, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            } else {
                print("Error: Unable to convert dictionary to JSON string.")
                return nil
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }

    static func convertStrToImage(_ imageStr: String) -> UIImage? {
        if let data: NSData = NSData(
            base64Encoded: imageStr,
            options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        {
            if let image: UIImage = UIImage(data: data as Data) {
                return image
            }
        }
        return nil
    }

    static func textHeight(_ text: String, _ maxWidth: CGFloat, _ font: UIFont)
        -> CGFloat
    {
        var attribute = [NSAttributedString.Key: Any]()
        attribute[.font] = font
        let size = text.boundingRect(
            with: CGSize(
                width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: attribute,
            context: nil
        ).size
        return size.height
    }
    
    static func textWidth(_ text: String, _ maxWidth: CGFloat, _ font: UIFont)
        -> CGFloat
    {
        var attribute = [NSAttributedString.Key: Any]()
        attribute[.font] = font
        let size = text.boundingRect(
            with: CGSize(
                width: maxWidth, height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: attribute,
            context: nil
        ).size
        return size.width
    }

    static func detectLanguageNL(with text: String) -> String? {
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)
        return recognizer.dominantLanguage?.rawValue ?? nil
    }
    
    public static func isSameLanguage(_ lang: String?) -> Bool {
        let sysLang = AppUtils.getLanguage().components(separatedBy: "-").first
        let thisLang = lang?.components(separatedBy: "-").first
        return sysLang == thisLang
    }
}
