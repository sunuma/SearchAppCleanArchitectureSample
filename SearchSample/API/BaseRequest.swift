//
//  BaseRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

/**
 *
 */
protocol BaseRequest {
    
    ///　レスポンスJSONデータ
    associatedtype Response
    
    ///　URL
    var baseUrl: URL { get }
    ///　メソッド
    var method: HTTPMethod { get }
    ///　URI
    var path: String { get }
    ///　リクエストパラメーター
    var parameters: [String: Any]? { get }
    ///　ヘッダーフィールド
    var httpHeaderFields: [String: String]? { get }
    
    ///　通信成功時
    func response(from data: Data, response: HTTPURLResponse) -> Response?
}


extension BaseRequest {
    
    var description: String {
        var _description = "--------------------------------------------\n" +
            "url : \(baseUrl.absoluteString)\n" +
            "\(method.rawValue)\n"
        
        if let parameters = parameters {
            _description += "\(parameters)\n"
        }
        if let httpHeaderFields = httpHeaderFields {
            _description += "\(httpHeaderFields)\n"
        }
        _description += "--------------------------------------------"
        return _description
    }
}


extension BaseRequest where Response: Decodable {
    
    ///　レスポンス時の共通マッピング処理
    func response(from data: Data, response: HTTPURLResponse) -> Response? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(Response.self, from: data)
            return decodeData
        } catch  {
            print("Failed to decode json data.")
            print("\(error.localizedDescription)")
            fatalError()
        }
        return nil
    }
    
}

///　リクエストパラメータープロトコル
///
protocol BaseParam {
    
    func getParameter() -> [String: Any]
}

class APIParam: BaseParam {
    
    func getParameter() -> [String : Any] {
        var param: [String : Any] = [:]
        param[APIParameterKey.keyId.rawValue]   = keyId
        param[APIParameterKey.format.rawValue]  = formatJson
        return param
    }
}
