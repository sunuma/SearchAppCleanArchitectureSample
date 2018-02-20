//
//  HttpClient.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire


struct HttpsClient {
    
    func request<T: BaseRequest>(_ request: T, success: @escaping (Decodable) -> Void, failure: @escaping ((ApiError) -> Void)) {
        
        let endPoint    = request.baseUrl
        let params      = request.parameters
        let headers     = request.httpHeaderFields
        let method      = request.method
        
        let req = Alamofire.request(endPoint, method: method, parameters: params, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: { response in
                //　リザルトエラー
                if let error = response.result.error {
                    failure(.resultError(error))
                    return
                }
                if let data = response.data, let responseData = response.response {
                    guard let model = request.response(from: data, response: responseData) else {
                        failure(.parseError(nil))
                        return
                    }
                    success(model as! Decodable)
                } else {
                    failure(.invalidResponse(nil))
                }
            })
        print("request = \(req.description)")
    }
    
}


enum ApiError: Error {
    
    case resultError(Error)
    case invalidResponse(Any?)
    case parseError(Any?)
    
    
    func errorDescription() -> String {
        var message = ""
        switch self {
        case let .resultError(error):
            message = "Result error = \(error.localizedDescription) "
            break
        case .invalidResponse:
            message = "Invalid response "
            break
        case .parseError:
            message = "Parse error "
            break
        }
        return message
    }
}
