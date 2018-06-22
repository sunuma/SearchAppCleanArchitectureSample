//
//  BaseRequest.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseRequest {
    associatedtype Response
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var httpHeaderFields: [String: String]? { get }
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
            appPrint("Failed to decode json data. \n\(String(data: data, encoding: .utf8) ?? "")")
            appDump(error)
            fatalError()
        }
        return nil
    }
}

protocol BaseParam {
    func getParameter() -> [String: Any]
}

struct APIParam: BaseParam {
    func getParameter() -> [String : Any] {
        var param: [String : Any] = [:]
        param[APIParameterKey.keyId.rawValue]   = keyId
        param[APIParameterKey.format.rawValue]  = formatJson
        return param
    }
}
