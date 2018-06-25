//
//  SelectAddressPresenter.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

protocol SelectAddressPresenterProtcol {
    var listData: PublishSubject<Prefectures> { get }
    var isStartIndicator: PublishSubject<Bool> { get }
    func subscribe()
}

class SelectAddressPresenter: SelectAddressPresenterProtcol {
    private(set) var useCase: SearchAddressUsecaseProtocol
    private(set) var listData = PublishSubject<Prefectures>()
    private(set) var isStartIndicator = PublishSubject<Bool>()
    
    init(usecase: SearchAddressUsecaseProtocol) {
        self.useCase = usecase
    }
    
    func subscribe() {
        let _ = useCase.fetch().subscribe(onNext: { [weak self] result in
            self?.listData.on(.next(result))
            self?.isStartIndicator.on(.next(false))
            }, onError: { [weak self] error in
                self?.listData.on(.error(error))
            }, onCompleted: { [weak self] in
                self?.listData.on(.completed)
                self?.isStartIndicator.on(.completed)
                appPrint("SelectAddressPresenter loadData completed.")
        })
    }
    
    deinit {}
}
