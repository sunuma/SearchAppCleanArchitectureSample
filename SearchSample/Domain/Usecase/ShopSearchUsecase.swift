//
//  ShopSearchUsecase.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol ShopSearchUsecaseProtocol {
    func fetch(param: ShopAPIParam) -> Observable<Shop>
}

class ShopSearchUsecase: ShopSearchUsecaseProtocol {
    var repository: ShopSearchRepositoryProtocol
    
    init(repository: ShopSearchRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetch(param: ShopAPIParam) -> Observable<Shop> {
        return repository.fetch(param: param)
    }
}
