//
//  IMManager.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import RxSwift
import THKIMSDK
import Kingfisher

public class IMManager: NSObject {

    static let shared = IMManager()
    private var debugMode = false

    func initIMConfig(_ debug: Bool) {
        self.debugMode = debug
        IMCoreManager.shared.crypto = IMCipher()
        IMCoreManager.shared.initApplication(self.debugMode)
        IMCoreManager.shared.userModule = IMUserModule()
        IMCoreManager.shared.contactModule = IMContactModule()
        IMCoreManager.shared.groupModule = IMGroupModule()
        IMCoreManager.shared.commonModule = IMCommonModule()
        IMCoreManager.shared.messageModule = IMMessageModule()

        IMUIManager.shared.msgCellAvatarWidth = 48
        IMUIManager.shared.msgCellAvatarLeft = 14
        IMUIManager.shared.msgCellAvatarRight = 8
        IMUIManager.shared.msgCellPadding = 24

        IMUIManager.shared.pageRouter = IMExternalPageRouter()
        IMUIManager.shared.uiResourceProvider = IMResourceProvider()
        
        let provider = Provider()
        let previewer = Previewer()
        IMUIManager.shared.contentProvider = provider
        IMUIManager.shared.contentPreviewer = previewer

        IMUIManager.shared.registerSessionCellProvider(SingleSessionProvider())
        IMUIManager.shared.registerSessionCellProvider(GroupSessionProvider())
        IMUIManager.shared.registerSessionCellProvider(
            SuperGroupSessionProvider())
    }

    func initIM(token: String, uId: Int64) -> Observable<Bool> {
        return Observable.just(true)
            .flatMap({ it in
                let apiEndpoint = Host.shared.endpointFor(type: "msg")
                let wsEndpoint = Host.shared.endpointFor(
                    type: "websocket")
                IMCoreManager.shared.api = DefaultIMApi(
                    token: token, endpoint: apiEndpoint)
                IMCoreManager.shared.signalModule = DefaultSignalModule(
                    token, wsEndpoint)
                IMCoreManager.shared.fileLoadModule = DefaultFileLoadModule(
                    token, apiEndpoint)
                
                IMUIManager.shared.contentPreviewer?.setTokenForEndpoint(
                    endPoint: apiEndpoint, token: token)
                IMUIManager.shared.initConfig()
                IMCoreManager.shared.initUser(uId)
                return Observable.just(it)
            })
    }

    func showDown() -> Observable<Bool> {
        return Observable.just(true).flatMap({ it in
            IMCoreManager.shared.shutDown()
            return Observable.just(it)
        })
    }
}
