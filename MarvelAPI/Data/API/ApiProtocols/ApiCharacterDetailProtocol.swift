//
//  ApiCharacterDetailProtocol.swift
//  MarvelAPI
//
//  Created by AlexR on 4/10/21.
//

import Foundation
import Alamofire

protocol ApiCharacterDetailProtocol{
    
    func getCharacterDetail(id: Int64, method: HTTPMethod,
                          completionHandler: @escaping (Result<MarvelData, AFError>) -> Void)
}
