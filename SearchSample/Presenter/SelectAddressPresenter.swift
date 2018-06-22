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
    var error: PublishSubject<ApiError> { get }
    var isStartIndicator: PublishSubject<Bool> { get }
    func loadData()
}

class SelectAddressPresenter: SelectAddressPresenterProtcol {
    private(set) var useCase: SearchAddressUsecaseProtocol
    private(set) var listData = PublishSubject<Prefectures>()
    private(set) var error = PublishSubject<ApiError>()
    private(set) var isStartIndicator = PublishSubject<Bool>()
    
    init(usecase: SearchAddressUsecaseProtocol) {
        self.useCase = usecase
    }
    
    deinit {}
}

extension SelectAddressPresenter {
    func loadData() {
        let _ = useCase.fetch().subscribe(onNext: { [weak self] result in
            self?.listData.on(.next(result))
            self?.isStartIndicator.on(.next(false))
        }, onError: { [weak self] error in
            self?.error.on(.error(error))
        }, onCompleted: {
            appPrint("SelectAddressPresenter loadData completed.")
        })
    }
}


