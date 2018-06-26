//
//  SelectCategoryRepository.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/26.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol SelectCategoryRepositoryProtocol {
    func fetch() -> Observable<CategorySmall>
}

class SelectCategoryRepository: SelectCategoryRepositoryProtocol {
    let dataStore = SelectCategoryDataStore()
    
    func fetch() -> Observable<CategorySmall> {
        return dataStore.fetch()
    }
}
