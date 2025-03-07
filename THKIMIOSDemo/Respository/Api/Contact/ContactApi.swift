//
//  ContactApi.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import Moya


enum ContactApi {
    case black(_ req: BlacklistVo)
    case cancelBlack(_ req: BlacklistVo)
    case follow(_ req: FollowVo)
    case cancelFollow(_ req: FollowVo)
    case createContactSession(_ req: CreateContactSessionReq)
    case queryLatestContactList(_ uId: Int64, _ mTime: Int64, _ count: Int, _ offset: Int)
    case queryContactByUserId(_ uId: Int64)
    case queryContactsByUserIds(_ uId: Int64, _ contactIds: [Int64])
    case queryContactList(_ uId: Int64, _ relation: Int, _ count: Int, _ offset: Int, _ keyword: String? = nil)
    case querySummary
    case setNoteName(_ req: SetNoteNameReq)
}

extension ContactApi: TargetType {
    var baseURL: URL {
        return URL.init(string: "\(Host.shared.endpointFor(type: "user"))/contact")!
    }

    var path: String {
        switch self {
        case .black(_):
            return "/black"
        case .cancelBlack(_):
            return "/black"
        case .follow(_):
            return "/follow"
        case .cancelFollow(_):
            return "/follow"
        case .createContactSession(_):
            return "/session"
        case .queryLatestContactList(_, _, _, _):
            return "/latest"
        case let .queryContactByUserId(uId):
            return "/user/\(uId)"
        case .queryContactsByUserIds:
            return "/user"
        case .queryContactList:
            return ""
        case .querySummary:
            return "/summary"
        case .setNoteName:
            return "/note_name"
        }
    }

    var method: Moya.Method {
        switch self {
        case .black(_):
            return .post
        case .cancelBlack(_):
            return .delete
        case .follow(_):
            return .post
        case .cancelFollow(_):
            return .delete
        case .createContactSession(_):
            return .post
        case .queryLatestContactList(_, _, _, _):
            return .get
        case .queryContactByUserId:
            return .get
        case .queryContactsByUserIds:
            return .get
        case .queryContactList:
            return .get
        case .querySummary:
            return .get
        case .setNoteName:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case let .black(req):
            return .requestJSONEncodable(req)
        case let .cancelBlack(req):
            return .requestJSONEncodable(req)
        case let .follow(req):
            return .requestJSONEncodable(req)
        case let .cancelFollow(req):
            return .requestJSONEncodable(req)
        case let .createContactSession(req):
            return .requestJSONEncodable(req)
        case let .queryLatestContactList(uId, mTime, count, offset):
            let urlParameters =
                ["u_id": uId, "m_time": mTime, "count": count, "offset": offset] as [String: Any]
            return .requestParameters(parameters: urlParameters, encoding: URLEncoding.queryString)
        case .queryContactByUserId:
            return .requestPlain
        case let .queryContactsByUserIds(uId, contactIds):
            var idsText = ""
            var index = 0
            for id in contactIds {
                idsText += "\(id)"
                index += 1
                if index < contactIds.count {
                    idsText += ","
                }
            }
            let urlParameters =
                [
                    "u_id": uId,
                    "contact_ids": idsText,
                ] as [String: Any]
            return .requestParameters(parameters: urlParameters, encoding: URLEncoding.queryString)
        case let .queryContactList(uId, relation, count, offset, keyword):
            var urlParameters =
                ["u_id": uId, "relation": relation, "count": count, "offset": offset]
                as [String: Any]
            if keyword != nil {
                urlParameters["keyword"] = keyword
            }
            return .requestParameters(parameters: urlParameters, encoding: URLEncoding.queryString)
        case .querySummary:
            return .requestPlain
        case let .setNoteName(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        return nil
    }

}
