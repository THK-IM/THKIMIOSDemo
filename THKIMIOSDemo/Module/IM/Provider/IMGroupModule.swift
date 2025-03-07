//
//  IMGroupModule.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import RxSwift
import THKIMSDK

class IMGroupModule: DefaultGroupModule {

    override func queryServerGroupById(id: Int64) -> Observable<Group> {
        return DataRepository.shared.groupApi.rx.request(.queryGroup(id)).asObservable()
            .compose(RxTransformer.shared.response2Bean(QueryGroupRes.self))
            .flatMap { res in
                return Observable.just(res.group.toGroup())
            }
    }

}
