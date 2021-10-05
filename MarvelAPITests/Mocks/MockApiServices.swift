//
//  MockApiServices.swift
//  MarvelAPITests
//
//  Created by AlexR on 4/10/21.
//

import Foundation
import Alamofire
@testable import MarvelAPI

class MockApiGetCharacters: ApiGetCharactersProtocol{
    func getAllCharacters(method: HTTPMethod,
                                   completionHandler: @escaping (Result<MarvelData, AFError>) -> Void) {
        
        let characters = [Character(id: 0,
                                    name: "Alex",
                                    urls: nil,
                                    thumbnail: nil,
                                    description: "Test1",
                                    modified: nil,
                                    comics: nil),
                          Character(id: 1,
                                    name: "Rivero",
                                    urls: nil,
                                    thumbnail: nil,
                                    description: "Test2",
                                    modified: nil,
                                    comics: nil)]
        
        let data = MarvelData(data: DataResult(results: characters))
        
        completionHandler(.success(data))
    }
    
}
