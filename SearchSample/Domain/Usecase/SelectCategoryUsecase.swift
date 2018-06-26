//
//  SelectCategoryUsecase.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/26.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol SelectCategoryUsecaseProtocol {
    func fetch() -> Observable<CategorySmall>
}

class SelectCategoryUsecase: SelectCategoryUsecaseProtocol {
    private var repository: SelectCategoryRepositoryProtocol
    
    init(repository: SelectCategoryRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetch() -> Observable<CategorySmall> {
        return repository.fetch()
    }
}
