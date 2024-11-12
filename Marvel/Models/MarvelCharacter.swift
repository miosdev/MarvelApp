//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

struct MarvelCharacter: Decodable, Identifiable {
    var id: Int
    var name: String?
    var thumbnail: MarvelImage?
    var description: String?
    var comics: Section?
    var series: Section?
    var stories: Section?
    var events: Section?
    var urls: [URLInfo]?
    
    var imageUrl: URL? {
        guard let path = thumbnail?.path, let `extension` = thumbnail?.extension else { return nil }
        return URL(string: "\(path).\(`extension`)")
    }
    
    struct Section: Decodable {
        var items: [Item]
    }
    
    struct Item: Decodable, Identifiable {
        var id = UUID()
        var resourceURI: String?
        var name: String?
        var imageUrl: URL?
        
        enum CodingKeys: String, CodingKey {
            case resourceURI
            case name
        }
    }
    
    struct URLInfo: Decodable, Identifiable {
        var id = UUID()
        var type: String?
        var url: String?
        
        var urlObj: URL? {
            guard let url else { return nil }
            return URL(string: url)
        }
        
        enum CodingKeys: String, CodingKey {
            case type
            case url
        }
    }
}
