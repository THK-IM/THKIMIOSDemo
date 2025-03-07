//
//  DataRepository.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import CocoaLumberjack
import Moya
import THKIMSDK
import UIKit
import Kingfisher

public class DataRepository: NSObject {

    static let shared = DataRepository()
    var env = "Debug"
    var maleAiUsers = Set<BasisUserVo>()
    var femaleAiUsers = Set<BasisUserVo>()
    lazy var app: UIApplication = {
        return _app!
    }()
    lazy var apiTokenInterceptor: APITokenInterceptor = {
        return _apiTokenInterceptor!
    }()

    lazy var userApi: MoyaProvider<UserApi> = {
        return _userApi!
    }()
    private var _userApi: MoyaProvider<UserApi>?

    lazy var contactApi: MoyaProvider<ContactApi> = {
        return _contactApi!
    }()
    private var _contactApi: MoyaProvider<ContactApi>?
    lazy var groupApi: MoyaProvider<GroupApi> = {
        return _groupApi!
    }()
    private var _groupApi: MoyaProvider<GroupApi>?

    private var _app: UIApplication?
    private var _apiTokenInterceptor: APITokenInterceptor?

    private var debug = false
    func initApplication(app: UIApplication, debug: Bool) {
        self._app = app
        self.debug = debug
        Host.shared.setDebug(debug)
        self._apiTokenInterceptor = APITokenInterceptor(token: "")
        self._apiTokenInterceptor?.addValidEndpoint(
            endpoint: Host.shared.endpointFor(type: "user"))
        self._userApi = MoyaProvider<UserApi>(plugins: [_apiTokenInterceptor!])
        self._contactApi = MoyaProvider<ContactApi>(plugins: [
            _apiTokenInterceptor!
        ])
        self._groupApi = MoyaProvider<GroupApi>(plugins: [_apiTokenInterceptor!]
        )
    }

    func updateToken(token: String) {
        self._apiTokenInterceptor?.updateToken(token: token)
    }

}
