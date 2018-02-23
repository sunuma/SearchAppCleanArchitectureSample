//
//  CategorySmall.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct CategorySmall: Decodable {
    
    private(set) var info: [CategorySmallInfo] = []
    
    private enum CodingKeys: String, CodingKey {
        case info = "category_s"
    }
    
}


struct CategorySmallInfo: Decodable {
    
    private(set) var parentCode: String
    private(set) var code: String
    private(set) var name: String
    
    private enum CodingKeys: String, CodingKey {
        case parentCode = "category_l_code"
        case code = "category_s_code"
        case name = "category_s_name"
    }
    
}
