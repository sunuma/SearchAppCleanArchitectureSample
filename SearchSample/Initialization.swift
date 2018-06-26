//
//  Initialization.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/22.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

func initializeSelectAddress() -> SelectAddressPresenterProtcol {
    let useCase = SelectAddressUsecase(repository: SelectAddressRepository())
    return SelectAddressPresenter(usecase: useCase)
}

func initializeShopSearch() -> ShopSearchPresenterProtocol {
    let useCase = ShopSearchUsecase(repository: ShopSearchRepository())
    return ShopSearchPresenter(usecase: useCase)
}

func initializeCurrentLocation() -> CurrentLocationPresenterProtocol {
    let useCase = CurrentLocationUsecase()
    return CurrentLocationPresenter(usecase: useCase)
}

func initializeSelectCategory() -> SelectCategoryPresenterProtocol {
    let useCase = SelectCategoryUsecase(repository: SelectCategoryRepository())
    return SelectCategoryPresenter(usecase: useCase)
}
