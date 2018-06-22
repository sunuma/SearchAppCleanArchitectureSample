//
//  ShopRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/21.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

/**
 * エリアデータ取得用リクエスト
 */
struct ShopRequest: BaseRequest {
    typealias Response = Shop
    var param = ShopAPIParam()
    var baseUrl: URL {
        return URL(string: baseURL + path)!
    }
    var method: HTTPMethod {
        return .get
    }
    var path: String {
        return "/RestSearchAPI/\(apiVersion)/"
    }
    var parameters: [String: Any]? {
        return param.getParameter()
    }
    var httpHeaderFields: [String: String]? {
        return nil
    }
}

struct ShopAPIParam: BaseParam {
    var id: String?
    var name: String?
    var address: String?
    var tel: String?
    var area: String?
    var pref: String?
    var latitude: Double?
    var longitude: Double?
    var freeWord: String?
    var noSmoking: Int?
    var card: Int?
    var lunch: Int?
    var desertBuffet: Int?
    var lunchBuffet: Int?
    
    func getParameter() -> [String : Any] {
        var param: [String: Any] = [:]
        param[APIParameterKey.keyId.rawValue] = keyId
        param[APIParameterKey.format.rawValue] = formatJson
        if let value = id { param[ShopParameterKey.id.rawValue] = value }
        if let value = name { param[ShopParameterKey.name.rawValue] = value }
        if let value = address { param[ShopParameterKey.address.rawValue] = value }
        if let value = tel { param[ShopParameterKey.tel.rawValue] = value }
        if let value = area { param[ShopParameterKey.area.rawValue] = value }
        if let value = pref { param[ShopParameterKey.pref.rawValue] = value }
        if let value = latitude { param[ShopParameterKey.latitude.rawValue] = value }
        if let value = longitude { param[ShopParameterKey.longitude.rawValue] = value }
        if let value = freeWord { param[ShopParameterKey.freeWord.rawValue] = value }
        if let value = noSmoking { param[ShopParameterKey.noSmoking.rawValue] = value }
        if let value = desertBuffet { param[ShopParameterKey.desertBuffet.rawValue] = value }
        if let value = lunchBuffet { param[ShopParameterKey.lunchBuffet.rawValue] = value }
        return param
    }
}
