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
    
    func fetch(request: CurrentLocationRequest) {
        // スタブ
        let data = CurrentLocation()
        self.output?.fetchComplete(data: data)
        /**
        HttpsClient().request(request, success: { result in
            if let data = result as? CurrentLocation {
                self.output?.fetchComplete(data: data)
            } else {
                
            }
        }, failure: { error in
            self.output?.failure(error: error)
        })*/
    }
}
