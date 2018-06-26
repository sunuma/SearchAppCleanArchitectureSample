//
//  SelectCategoryPresenter.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/19.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

protocol SelectCategoryPresenterProtocol {
    var listData: PublishSubject<CategorySmall> { get }
    func subscribe()
}

class SelectCategoryPresenter: SelectCategoryPresenterProtocol {
    private(set) var useCase: SelectCategoryUsecaseProtocol
    private(set) var listData = PublishSubject<CategorySmall>()
    
    init(usecase: SelectCategoryUsecaseProtocol) {
        self.useCase = usecase
    }
    
    func subscribe() {
        let _ = useCase.fetch().subscribe(onNext: { [weak self] result in
            self?.listData.on(.next(result))
        }, onError: { [weak self] error in
            self?.listData.on(.error(error))
        }, onCompleted: {
            self.listData.on(.completed)
            appPrint("SelectCategoryPresenter subscribe completed.")
        })
    }
}
