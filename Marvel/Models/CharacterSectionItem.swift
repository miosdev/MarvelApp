//
//  CharacterSectionItem.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

struct CharacterSectionItem: Decodable {
    var thumbnail: MarvelImage?
    
    var imageUrl: URL? {
        guard let path = thumbnail?.path, let `extension` = thumbnail?.extension else { return nil }
        return URL(string: "\(path).\(`extension`)")
    }
}
