//
//  UserApi.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import Moya

enum UserApi {
    /// 查询多个用户基础信息
    case queryUsers(ids: Set<Int64>)
}

extension UserApi: TargetType {
    

    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL {
        return URL.init(
            string: "\(Host.shared.endpointFor(type: "user"))/user")!
        
    }

    var path: String {
        switch self {
        case .queryUsers:
            return "/query"
        }
    }

    var method: Moya.Method {
        switch self {
        case .queryUsers:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case let .queryUsers(ids):
            var i = 0
            var params = ""
            for id in ids {
                if i == 0 {
                    i += 1
                } else {
                    params += ","
                }
                params += "\(id)"
            }
            let urlParameters =
            [
                "ids": params
            ] as [String: Any]
            return .requestParameters(
                parameters: urlParameters, encoding: URLEncoding.queryString)
        }
    }
}
