//
//  SelectCategoryDataStore.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/26.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

struct SelectCategoryDataStore {
    func fetch() -> Observable<CategorySmall> {
        return Observable.create { (observer) -> Disposable in
            HttpsClient().request(CategorySmallRequest(), success: { decodable in
                if let model = decodable as? CategorySmall { observer.on(.next(model)) }
                observer.on(.completed)
            }, failure: { error in
                observer.on(.error(error))
            })
            return Disposables.create()
        }
    }
}
