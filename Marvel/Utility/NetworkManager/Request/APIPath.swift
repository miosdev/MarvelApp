//
//  APIName.swift
//  DesignTest
//
//  Created by Macbook Pro on 11/23/21.
//

import Foundation

enum APIPath {
    case characters
    case none
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .none:
            return ""
        }
    }
}
