//
//  ShopSearchPresenter.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol ShopSearchPresenterProtocol {
    var shopData: PublishSubject<Shop> { get }
    func fetch(param: ShopAPIParam)
}

class ShopSearchPresenter: ShopSearchPresenterProtocol {
    private(set) var useCase: ShopSearchUsecaseProtocol
    private(set) var shopData = PublishSubject<Shop>()
    private let disposeBag = DisposeBag()
    
    init(usecase: ShopSearchUsecaseProtocol) {
        self.useCase = usecase
    }
    
    func fetch(param: ShopAPIParam) {
        useCase.fetch(param: param).subscribe(onNext: { [weak self] result in
            self?.shopData.on(.next(result))
        }, onError: { [weak self] error in
            self?.shopData.on(.error(error))
        }, onCompleted: { [weak self] in
            self?.shopData.on(.completed)
            appPrint("ShopSearchPresenter fetch completed.")
        }).disposed(by: disposeBag)
    }
    
    deinit {}
}
