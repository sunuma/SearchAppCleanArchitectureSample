//
//  AreaLarge.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct AreaLarge: Decodable {
    
    private(set) var info: [AreaLargeInfo] = []
    
    private enum CodingKeys: String, CodingKey {
        case info = "garea_large"
    }
    
}

struct AreaLargeInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    private(set) var info: AreaLPrefInfo
    
    private enum CodingKeys: String, CodingKey {
        case code = "areacode_l"
        case name = "areaname_l"
        case info = "pref"
    }
    
}

struct AreaLPrefInfo: Decodable {
    
    var code: String
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "pref_code"
        case name = "pref_name"
    }
    
}
