//
//  InputAddressUsecase.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

enum ValidationResult {
    case valid
    case invalid([String])
}

class InputAddressUsecase {
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
