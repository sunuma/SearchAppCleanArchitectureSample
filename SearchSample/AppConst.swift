//
//  AppConst.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation

/**
 * トップ画面で選択した検索種別
 * - address: 住所から検索
 * - purpose: 目的から検索
 * - category: カテゴリから検索
 */
enum SelectSearchType {
    case address
    case purpose
    case category
}

let currentSearchType: SelectSearchType = .address

let baseURL = "https://api.gnavi.co.jp"
//
let apiVersion = "20150630"
//
let keyId = ""
let formatJson = "json"


enum APIParameterKey: String {
    case keyId  = "keyid"
    case format = "format"
}
