//
//  AreaMiddle.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct AreaMiddle: Decodable {
    
    private(set) var info: [AreaMiddleInfo] = []
    
    private enum CodingKeys: String, CodingKey {
        case info = "garea_middle"
    }
    
}

struct AreaMiddleInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    private(set) var areaLInfo: AreaLInfo
    private(set) var prefInfo: AreaPrefInfo
    
    private enum CodingKeys: String, CodingKey {
        case code       = "areacode_m"
        case name       = "areaname_m"
        case areaLInfo  = "garea_large"
        case prefInfo   = "pref"
    }
    
}


