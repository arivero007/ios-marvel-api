//
//  ApiCharacters.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation

struct MarvelData: Codable, Equatable {
    let data: DataResult
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct DataResult: Codable, Equatable {
    var results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
