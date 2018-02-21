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
/**
 * ぐるなび Web Service サイトのAPIテストツールから
 * http://api.gnavi.co.jp/api/tools/
 */
let keyId = ""
let formatJson = "json"

let addressTextFieldMax = 150


enum APIParameterKey: String {
    case keyId  = "keyid"
    case format = "format"
}

enum ShopParameterKey: String {
    case id         = "id"
    case name       = "name"
    case address    = "address"
    case tel        = "tel"
    case area       = "area"
    case pref       = "pref"
    case latitude   = "latitude"
    case longitude  = "longitude"
    case freeWord   = "freeword"
    case noSmoking  = "no_smoking"
    case desertBuffet   = "desert_buffet"
    case lunchBuffet    = "lunch_buffet"
}
