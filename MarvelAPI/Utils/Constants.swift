//
//  Constants.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation


struct Constants {
    
    // MARK: - END POINTS
    static  let url = Configuration.baseURL
    static  let api = "/v1"
    static  let access = "/public"
    
    static  let urlBase = "\(url)\(api)\(access)"
    
    // MARK: - Marvel API
    static let apiKeyPri = "1086c3673d4573cd881f5cdc2c7b276bd6ea66d3"
    static let apiKeyPub = "3a7c397353768be0b0a6c9b4a16e6b83"
}
