//
//  Prefectures.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct Prefectures: Decodable {
    
    var info: [PrefecturesInfo] = []

    private enum CodingKeys: String, CodingKey {
        case info = "pref"
    }
}

struct PrefecturesInfo: Decodable {
    
    var code: String
    var name: String
    var areaCode: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "pref_code"
        case name = "pref_name"
        case areaCode = "area_code"
    }
}
