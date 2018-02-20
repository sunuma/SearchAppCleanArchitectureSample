//
//  InputAddressDataStore.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

class InputAddressDataStore {
    
    weak var output: InputAddressUsecaseOutput?
    
    func fetch(request: InputAddressRequest) {
        // スタブ
        let data = InputAddress()
        self.output?.fetchComplete(data: data)
        /**
        HttpsClient().request(request, success: { result in
            guard let data = result as? InputAddress else {
                return
            }
            print("\(data)")
            self.output?.fetchComplete(data: data)
        }, failure: { error in
            self.output?.failure(error: error)
        }) */
    }
    
}
