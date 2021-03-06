//
//  SearchAddressRepository.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/22.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol SelectAddressRepositoryProtocol {
    func fetch() -> Observable<Prefectures>
}

class SelectAddressRepository: SelectAddressRepositoryProtocol {
    let dataStore = SelectAddressDataStore()
    
    func fetch() -> Observable<Prefectures> {
        return dataStore.fetch()
    }
}
