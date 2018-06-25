//
//  CurrentLocationPresenter.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RxSwift

protocol CurrentLocationPresenterProtocol {
    var useCase: CurrentLocationUsecaseProtocol { get }
    func requestLocation()
}

class CurrentLocationPresenter: CurrentLocationPresenterProtocol {
    private(set) var useCase: CurrentLocationUsecaseProtocol
    private var disposeBag = DisposeBag()
    
    init(usecase: CurrentLocationUsecaseProtocol) {
        self.useCase = usecase
    }
    
    func requestLocation() {
        useCase.requestLocation()
    }
}
