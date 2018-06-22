//
//  Initialization.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/22.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

func initializeSelectAddress() -> SelectAddressPresenterProtcol {
    let useCase = SearchAddressUsecase(repository: SearchAddressRepository())
    return SelectAddressPresenter(usecase: useCase)
}
