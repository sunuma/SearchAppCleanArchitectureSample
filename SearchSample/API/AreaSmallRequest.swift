//
//  AreaSmallRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

/**
 * エリア大データ取得用リクエスト
 */
struct AreaSmallRequest: BaseRequest {
    
    typealias Response = AreaSmall
    
    var baseUrl: URL {
        return URL(string: baseURL + path)!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/master/GAreaSmallSearchAPI/\(apiVersion)/"
    }
    
    var parameters: [String: Any]? {
        return APIParam().getParameter()
    }
    
    var httpHeaderFields: [String: String]? {
        return nil
    }
    
}
