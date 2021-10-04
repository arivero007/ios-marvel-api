//
//  AFWrapper.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation
import Alamofire

final class AFWrapper: NSObject {
    
    static let shared = AFWrapper()
    
    var session: Session = {
      let configuration = URLSessionConfiguration.af.default
      configuration.timeoutIntervalForRequest = 20
      return Session(configuration: configuration)
    }()
    
}

extension AFWrapper {
    
    func request<T: Codable>(_ url: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, completionHandler: @escaping (Result<T, AFError>) -> Void) {
        
        let finalUrl = "\(url)\(getEndAuthentication())"
        
        print(finalUrl)
        print()
        print(parameters ?? "no-parameters")
        
        session.request(finalUrl, method: method, parameters: parameters, encoding: encoding)
            .responseDecodable{ (response: DataResponse<T, AFError>) in
            // DEBUG DATA
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "no-data-response")
            }
            
            switch response.result {
            case .success(let decoded):
                completionHandler(.success(decoded))
            case .failure(let e):
                print(e)
                completionHandler(.failure(e.asAFError(orFailWith: "Service failure")))
            }
        }
    }
    
}


