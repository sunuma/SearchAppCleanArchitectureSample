//
//  SearchAddressUsecase.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

protocol SearchAddressUsecaseOutput: class {
    
}

/**
 *
 */
class SearchAddressUsecase {
    
    let dataStore = SearchAddressDataStore()
    
    init() {
        
    }

}

extension SearchAddressUsecase: SearchAddressUsecaseOutput {
    
}