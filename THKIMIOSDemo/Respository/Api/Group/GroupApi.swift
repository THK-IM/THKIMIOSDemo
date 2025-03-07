//
//  GroupApi.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import Moya

enum GroupApi {
    case queryJoinGroups(_ count: Int, _ offset: Int, _ keyword: String? = nil)
    case queryGroup(
        _ id: Int64, _ needOnlineCount: Int = 0, _ needApplyCount: Int = 0)
    case createGroup(_ req: CreateGroupReq)
    case updateGroup(_ req: UpdateGroupReq)
    case joinGroup(_ req: JoinGroupReq)
    case queryJoinGroupApplies(_ groupId: Int64, _ count: Int, _ offset: Int)
    case queryJoinGroupApply(_ applyId: Int64)
    case applyJoinGroup(_ req: PostJoinGroupApplyReq)
    case leaveGroup(_ req: LeaveGroupReq)
    case kickoffGroupMember(_ req: KickoffGroupMemberReq)
    case disbandGroup(_ req: DisbandGroupReq)
    case muteGroup(_ req: MuteGroupReq)
    case updateGroupMemberRole(_ req: UpdateGroupMemberRoleReq)
}

extension GroupApi: TargetType {
    var path: String {
        switch self {
        case .queryJoinGroups:
            return "/joins"
        case let .queryGroup(id, _, _):
            return "/\(id)"
        case .createGroup:
            return ""
        case let .updateGroup(req):
            return "/\(req.groupId)"
        case .joinGroup:
            return "/join"
        case .queryJoinGroupApplies:
            return "/applies"
        case .queryJoinGroupApply:
            return "/apply"
        case .applyJoinGroup:
            return "/apply"
        case .leaveGroup:
            return "/leave"
        case .kickoffGroupMember:
            return "/member"
        case .disbandGroup:
            return "/disband"
        case .muteGroup:
            return "/mute"
        case .updateGroupMemberRole:
            return "/member/role"
        }
    }

    var method: Moya.Method {
        switch self {
        case .queryJoinGroups:
            return .get
        case .queryGroup:
            return .get
        case .createGroup:
            return .post
        case .updateGroup:
            return .put
        case .joinGroup:
            return .post
        case .queryJoinGroupApplies:
            return .get
        case .queryJoinGroupApply:
            return .get
        case .applyJoinGroup:
            return .post
        case .leaveGroup:
            return .post
        case .kickoffGroupMember:
            return .delete
        case .disbandGroup:
            return .post
        case .muteGroup:
            return .post
        case .updateGroupMemberRole:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case let .queryJoinGroups(count, offset, keyword):
            var urlParameters =
                [
                    "count": count,
                    "offset": offset,
                ] as [String: Any]
            if keyword != nil {
                urlParameters["keyword"] = keyword
            }
            return .requestParameters(
                parameters: urlParameters, encoding: URLEncoding.queryString)
        case let .queryGroup(_, needOnlineCount, needApplyCount):
            let urlParameters =
                [
                    "need_online_count": needOnlineCount,
                    "need_apply_count": needApplyCount,
                ] as [String: Any]
            return .requestParameters(
                parameters: urlParameters, encoding: URLEncoding.queryString)
        case let .createGroup(req):
            return .requestJSONEncodable(req)
        case let .updateGroup(req):
            return .requestJSONEncodable(req)
        case let .joinGroup(req):
            return .requestJSONEncodable(req)
        case let .queryJoinGroupApplies(groupId, count, offset):
            let urlParameters =
                [
                    "group_id": groupId,
                    "count": count,
                    "offset": offset,
                ] as [String: Any]
            return .requestParameters(
                parameters: urlParameters, encoding: URLEncoding.queryString)
        case let .queryJoinGroupApply(applyId):
            let urlParameters =
                [
                    "apply_id": applyId
                ] as [String: Any]
            return .requestParameters(
                parameters: urlParameters, encoding: URLEncoding.queryString)
        case let .applyJoinGroup(req):
            return .requestJSONEncodable(req)
        case let .leaveGroup(req):
            return .requestJSONEncodable(req)
        case let .disbandGroup(req):
            return .requestJSONEncodable(req)
        case let .muteGroup(req):
            return .requestJSONEncodable(req)
        case let .kickoffGroupMember(req):
            return .requestJSONEncodable(req)
        case let .updateGroupMemberRole(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL {
        return URL.init(
            string: "\(Host.shared.endpointFor(type: "user"))/group")!
    }
}
