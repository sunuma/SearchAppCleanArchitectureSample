//
//  CategoryEntity.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/23.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryEntity: Object {
    
    @objc dynamic var categoryS: String = ""
    @objc dynamic var categoryM: String = ""
    @objc dynamic var categoryL: String = ""
}
