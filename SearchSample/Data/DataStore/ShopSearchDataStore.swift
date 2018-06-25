//
//  ShopSearchDataStore.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

struct ShopSearchDataStore {
    func fetch(param: ShopAPIParam) -> Observable<Shop> {
        return Observable.create({ (observer) -> Disposable in
            var request = ShopRequest()
            request.param = param
            HttpsClient().request(request, success: { decodable in
                if let model = decodable as? Shop { observer.on(.next(model)) }
                observer.on(.completed)
            }, failure: { error in
                observer.on(.error(error))
            })
            return Disposables.create()
        })
    }
}
