//
//  CategoryLarge.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct CategoryLarge: Decodable {
    
    private(set) var info: [CategoryLargeInfo] = []
    
    private enum CodingKeys: String, CodingKey {
        case info = "category_l"
    }
    
}


struct CategoryLargeInfo: Decodable {
    
    private(set) var code: String
    private(set) var name: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "category_l_code"
        case name = "category_l_name"
    }
}
