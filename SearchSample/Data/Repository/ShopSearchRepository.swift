//
//  ShopSearchRepository.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol ShopSearchRepositoryProtocol {
    func fetch(param: ShopAPIParam) -> Observable<Shop>
}

class ShopSearchRepository: ShopSearchRepositoryProtocol {
    let dataStore = ShopSearchDataStore()
    
    func fetch(param: ShopAPIParam) -> Observable<Shop> {
        return dataStore.fetch(param: param)
    }
}
