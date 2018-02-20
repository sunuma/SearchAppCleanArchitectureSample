//
//  AreaSmall.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct AreaSmall: Decodable {
    
    var info: [AreaSmallInfo] = []
    
    private enum CodingKeys: String, CodingKey {
        case info = "garea_small"
    }
    
}

struct AreaSmallInfo: Decodable {
    
    var code: String
    var name: String
    var areaLInfo: AreaLInfo
    var areaMInfo: AreaMInfo
    var prefInfo: AreaPrefInfo
    
    private enum CodingKeys: String, CodingKey {
        case code       = "areacode_s"
        case name       = "areaname_s"
        case areaLInfo  = "garea_large"
        case areaMInfo  = "garea_middle"
        case prefInfo   = "pref"
    }
    
}
