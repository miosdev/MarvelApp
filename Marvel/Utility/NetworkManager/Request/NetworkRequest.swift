//
//  File.swift
//  DesignTest
//
//  Created by Macbook Pro on 11/23/21.
//

import Foundation
import Alamofire

struct NetworkRequest {
    var endpoint: NetworkEndpoint
    var apiPath: APIPath
    var httpMethod: HTTPMethod
    var headers: HTTPHeaders = [:]
    var parameters: Parameters = [:]
    var parameterEncoding: ParameterEncoding = JSONEncoding.default
    
    var fullUrl: String {
        endpoint.url + apiPath.path + getQuery
    }
    
    var getQuery: String {
        var query = "?"
        parameters.forEach { (parameter) in
            query += "\(parameter.key)=\(parameter.value)&"
        }
        query.removeLast()
        return query
    }
}
