//
//  IMContactModule.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import THKIMSDK
import RxSwift

class IMContactModule: DefaultContactModule {
    
    override func queryServerContactByUserId(_ id: Int64) -> Observable<Contact> {
//        return DataRepository.shared.contactApi.rx.request(.queryContactByUserId(id)).asObservable()
//            .compose(RxTransformer.shared.response2Bean(QueryContactRes.self))
//            .flatMap { res in
//                return Observable.just(res.contact.toContact())
//            }
        // TODO 业务实现自己的查询联系人逻辑
        return super.queryServerContactByUserId(id)
    }
}
