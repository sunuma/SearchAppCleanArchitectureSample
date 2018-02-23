//
//  Area.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct Area: Decodable {
    
    private(set) var info: [AreaInfo] = []
    
    private enum CodingKeys: String, CodingKey {
        case info = "area"
    }

}

struct AreaInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "area_code"
        case name = "area_name"
    }
}
