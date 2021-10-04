//
//  ApiCharacterDetailService.swift
//  MarvelAPI
//
//  Created by AlexR on 4/10/21.
//

import Foundation

import Alamofire

class ApiCharacterDetailService: ApiCharacterDetailProtocol{
    
    func getCharacterDetail(id: Int64, method: HTTPMethod, completionHandler: @escaping (Result<MarvelData, AFError>) -> Void) {
        let url = "\(Constants.urlBase)/characters/\(id)"
        AFWrapper.shared.request(url, method: .get, parameters: nil){ result in
            completionHandler(result)
        }
    }
    
}
