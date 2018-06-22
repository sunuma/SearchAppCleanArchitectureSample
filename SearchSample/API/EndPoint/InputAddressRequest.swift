//
//  InputAddressRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire


struct InputAddressRequest: BaseRequest {
    typealias Response = InputAddress
    var baseUrl: URL {
        return URL(string: baseURL + path)!
    }
    var method: HTTPMethod {
        return .get
    }
    var path: String {
        return ""
    }
    var parameters: [String : Any]? {
        return nil
    }
    var httpHeaderFields: [String : String]? {
        return nil
    }
}
