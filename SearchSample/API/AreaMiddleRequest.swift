//
//  AreaMiddleRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

/**
 * エリア中データ取得用リクエスト
 */
struct AreaMiddleRequest: BaseRequest {
    
    typealias Response = AreaMiddle
    
    var baseUrl: URL {
        return URL(string: baseURL + path)!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/master/GAreaMiddleSearchAPI/\(apiVersion)/"
    }
    
    var parameters: [String: Any]? {
        return APIParam().getParameter()
    }
    
    var httpHeaderFields: [String: String]? {
        return nil
    }
    
}
