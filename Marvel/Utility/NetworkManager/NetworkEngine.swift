//
//  NetworkLayer.swift
//  DesignTest
//
//  Created by Macbook Pro on 11/23/21.
//

import Foundation
import Alamofire

class NetworkEngine {
    static let shared = NetworkEngine()
    
    private init() {}
    
    func request<T: Decodable>(_ type: T.Type, request: NetworkRequest) async -> Result<T, AFError> {
        guard let url = URL(string: request.fullUrl) else { return .failure(.invalidURL(url: request.fullUrl)) }
        print("HTTP REQUEST \(url)\(request.parameters)")
        return await AF.request(url, method: request.httpMethod, parameters: request.httpMethod == .get ? nil : request.parameters, encoding: request.parameterEncoding, headers: request.headers).serializingDecodable(T.self).result
    }
}
