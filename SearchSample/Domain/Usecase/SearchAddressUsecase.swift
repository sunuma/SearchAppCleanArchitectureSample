//
//  SearchAddressUsecase.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchAddressUsecaseProtocol {
    func fetch() -> Observable<Prefectures>
}

/**
 *
 */
class SearchAddressUsecase: SearchAddressUsecaseProtocol {
    var repository: SearchAddressRepositoryProtocol
    
    init(repository: SearchAddressRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetch() -> Observable<Prefectures> {
        return repository.fetch()
    }
}
