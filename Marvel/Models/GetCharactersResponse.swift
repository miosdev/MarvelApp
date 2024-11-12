//
//  GetCharactersResponse.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

struct GetCharactersResponse: Decodable {
    var data: ResponseData
    
    struct ResponseData: Decodable {
        var total: Int
        var results: [MarvelCharacter]
    }
}
