//
//  Endpoint.swift
//  DesignTest
//
//  Created by Macbook Pro on 11/23/21.
//

import Foundation

enum NetworkEndpoint {
    case gateway
    case custom(String)
    
    var url: String {
        switch self {
        case .gateway:
            return "https://gateway.marvel.com"
        case .custom(let url):
            return url
        }
    }
}
