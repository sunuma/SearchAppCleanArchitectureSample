//
//  AreaSubInfo.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

struct AreaLInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "areacode_l"
        case name = "areaname_l"
    }
    
}

struct AreaMInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "areacode_m"
        case name = "areaname_m"
    }
    
}

struct AreaPrefInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "pref_code"
        case name = "pref_name"
    }
    
}
