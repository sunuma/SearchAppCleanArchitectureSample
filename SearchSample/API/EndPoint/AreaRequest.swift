//
//  AreaRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

/**
 * エリアデータ取得用リクエスト
 */
struct AreaRequest: BaseRequest {
    typealias Response = Area
    var baseUrl: URL {
        return URL(string: baseURL + path)!
    }
    var method: HTTPMethod {
        return .get
    }
    var path: String {
        return "/master/AreaSearchAPI/\(apiVersion)/"
    }
    var parameters: [String: Any]? {
        return APIParam().getParameter()
    }
    var httpHeaderFields: [String: String]? {
        return nil
    }
}
