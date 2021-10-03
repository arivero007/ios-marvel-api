//
//  ApiGetCharactersProtocol.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation
import Alamofire

protocol ApiGetCharactersProtocol{
    
    func getAllCharacters(method: HTTPMethod,
                          completionHandler: @escaping (Result<MarvelData, AFError>) -> Void)
}
