//
//  Prefectures.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct Prefectures: Decodable {
    
    private(set) var info: [PrefecturesInfo] = []

    private enum CodingKeys: String, CodingKey {
        case info = "pref"
    }
}

struct PrefecturesInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    private(set) var areaCode: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "pref_code"
        case name = "pref_name"
        case areaCode = "area_code"
    }
}
