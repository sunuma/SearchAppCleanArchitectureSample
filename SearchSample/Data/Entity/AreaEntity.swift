//
//  AreaEntity.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/23.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import RealmSwift

class AreaEntity: Object {
    
    @objc dynamic var code: String  = ""
    @objc dynamic var name: String  = ""
    @objc dynamic var codeM: String = ""
    @objc dynamic var nameM: String = ""
    @objc dynamic var codeL: String = ""
    @objc dynamic var nameL: String = ""
    
}
