//
//  ApiCharacter.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation

struct Character: Codable {
    let id: Int64
    let name: String
    let thumbnail: Thumbnail?
    let description: String?
    let modified: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case description
        case modified
    }
}

struct Thumbnail: Codable {
    let path: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case type = "extension"
    }
}
