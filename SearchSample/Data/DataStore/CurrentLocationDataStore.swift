//
//  CurrentLocationDataStore.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


class CurrentLocationDataStore {
    
    weak var output: CurrentLocationUsecaseOutput?
    
    func fetch(request: ShopRequest) {
        HttpsClient().request(request, success: { result in
            if let data = result as? Shop {
                self.output?.fetchComplete(data: data)
            } else {
                self.output?.failure(error: .parseError(nil))
            }
        }, failure: { error in
            self.output?.failure(error: error)
        })
    }
}
