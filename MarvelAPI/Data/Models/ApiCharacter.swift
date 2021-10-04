//
//  ApiCharacter.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation

struct Character: Codable, Equatable {
    let id: Int64
    let name: String
    let urls: [Urls]?
    let thumbnail: Thumbnail?
    let description: String?
    let modified: String?
    let comics: Comics?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case urls
        case thumbnail
        case description
        case modified
        case comics
    }
}

struct Thumbnail: Codable, Equatable {
    let path: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case type = "extension"
    }
}

struct Urls: Codable, Equatable {
    let type: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
    }
}

struct Comics: Codable, Equatable {
    let available: Int
    
    enum CodingKeys: String, CodingKey {
        case available
    }
}
