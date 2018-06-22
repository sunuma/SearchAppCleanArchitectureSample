//
//  CategoryLargeRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/20.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

/**
 * 業態カテゴリ大データ取得用リクエスト
 */
struct CategoryLargeRequest: BaseRequest {
    typealias Response = CategoryLarge
    var baseUrl: URL {
        return URL(string: baseURL + path)!
    }
    var method: HTTPMethod {
        return .get
    }
    var path: String {
        return "/master/CategoryLargeSearchAPI/\(apiVersion)/"
    }
    var parameters: [String: Any]? {
        return APIParam().getParameter()
    }
    var httpHeaderFields: [String: String]? {
        return nil
    }
}
