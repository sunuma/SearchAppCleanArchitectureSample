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
                        failure(.parseError("failed to \(String(describing: T.Response.self)) class json parse."))
                        return
                    }
                    success(model as! Decodable)
                } else {
                    var message = ""
                    if response.data == nil {
                        message += "response.data is nil. "
                    }
                    if response.response == nil {
                        message += "response.response is nil"
                    }
                    failure(.invalidResponse(message))
                }
            })
        print("request = \(req.description)")
    }
    
}


enum ApiError: Error {
    
    case resultError(Error)
    case invalidResponse(String?)
    case parseError(String?)
    case castError(String?)
    
    func errorDescription() -> String {
        var message = ""
        switch self {
        case let .resultError(error):
            message = "Result error = \(error.localizedDescription) "
            break
        case .invalidResponse(let msg):
            message = "Invalid response: "
            if let value = msg { message += value }
            break
        case .parseError(let msg):
            message = "Parse error: "
            if let value = msg { message += value }
            break
        case .castError(let msg):
            message = "Cast error: "
            if let value = msg { message += value }
            break
        }
        return message
    }
}
