//
//  InputAddressUsecase.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

/**
 *
 */
enum ValidationResult {
    case valid
    case invalid([String])
}

/**
 *
 */
protocol InputAddressUsecaseOutput: class {
    func fetchComplete(data: InputAddress)
    func failure(error: ApiError)
}

/**
 *
 */
class InputAddressUsecase {
    
    weak var input: SelectAddressViewInput?
    
    let dataStore = InputAddressDataStore()
    
    init() {
       dataStore.output = self
    }
    
    func searchInputText(_ text: String) {
        let result = validate(text)
        switch result {
        case .valid:
            let request = InputAddressRequest()
            dataStore.fetch(request: request)
            break
        case .invalid(let messages):
            messages.forEach { print($0) }
            break
        }
    }
    
    private func validate(_ text: String) -> ValidationResult {
        if text == "" {
            return .invalid(["text is empty"])
        }
        if text.count > addressTextFieldMax {
            return .invalid(["character's count is over \(addressTextFieldMax)"])
        }
        return .valid
    }
    
}

extension InputAddressUsecase: InputAddressUsecaseOutput {
    
    // MARK: - InputAddressUsecaseOutput
    
    func fetchComplete(data: InputAddress) {
        input?.successTextField()
    }
    
    func failure(error: ApiError) {
        input?.failureTextField(error: error)
    }
    
}
