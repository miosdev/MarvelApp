//
//  GetSectionInfoResponse.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

struct GetSectionInfoResponse: Decodable {
    var data: ResponseData
    
    struct ResponseData: Decodable {
        var results: [CharacterSectionItem]
    }
}
