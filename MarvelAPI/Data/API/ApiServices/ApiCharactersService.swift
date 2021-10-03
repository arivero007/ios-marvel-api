//
//  ApiServices.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation
import Alamofire

class ApiCharactersService: ApiGetCharactersProtocol{
    
    func getAllCharacters(method: HTTPMethod, completionHandler: @escaping (Result<MarvelData, AFError>) -> Void) {
        let url = "\(Constants.urlBase)/characters"
        AFWrapper.shared.request(url, method: .get, parameters: nil){ result in
            completionHandler(result)
        }
    }
    
}
