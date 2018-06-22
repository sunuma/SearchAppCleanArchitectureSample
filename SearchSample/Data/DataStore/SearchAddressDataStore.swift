//
//  SearchAddressDataStore.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

class SearchAddressDataStore {
    func fetch() -> Observable<Prefectures> {
        return Observable.create({ (observer) -> Disposable in
            HttpsClient().request(PrefecturesRequest(), success: { decodable in
                if let model = decodable as? Prefectures { observer.on(.next(model)) }
                observer.on(.completed)
            }, failure: { error in
                observer.on(.error(error))
            })
            return Disposables.create()
        })
    }
}
