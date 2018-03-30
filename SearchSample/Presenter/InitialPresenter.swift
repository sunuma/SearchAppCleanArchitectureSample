//
//  InitialPresenter.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/28.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

/**
 *
 *
 */
class InitialPresenter {
    
    let area        = Variable<Area>(Area())
    let prefectures = Variable<Prefectures>(Prefectures())
    let areaL       = Variable<AreaLarge>(AreaLarge())
    let areaM       = Variable<AreaMiddle>(AreaMiddle())
    let areaS       = Variable<AreaSmall>(AreaSmall())
    let categoryL   = Variable<CategoryLarge>(CategoryLarge())
    let categoryM   = Variable<CategorySmall>(CategorySmall())
    
    
    func loadData() {
        
    }
    
    private func fetchArea() {
        HttpsClient().request(AreaRequest(), success: { result in
            
        }, failure: { error in
            
        })
    }
    
    private func fetchPrefectures() {
        HttpsClient().request(PrefecturesRequest(), success: { result in
            
        }, failure: { error in
            
        })
    }
    
    private func fetchAreaLarge() {
        HttpsClient().request(AreaLargeRequest(), success: { result in
            
        }, failure: { error in
            
        })
    }
    
    private func fetchAreaMiddle() {
        HttpsClient().request(AreaMiddleRequest(), success: { result in
            
        }, failure: { error in
            
        })
    }
    
    private func fetchAreaSmall() {
        HttpsClient().request(AreaSmallRequest(), success: { result in
            
        }, failure: { error in
            
        })
    }
}
