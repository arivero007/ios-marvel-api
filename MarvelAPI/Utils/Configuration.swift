//
//  Configuration.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation

enum Configuration: String {
    
    // MARK: - Configurations
    case Marvel = "com.arivero.MarvelAPI"
    
    // MARK: - Current Configuration
    static let currentTarget: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String else {
            fatalError("No Target Found")
        }
        
        guard let configuration = Configuration(rawValue: rawValue) else {
            fatalError("Invalid Target")
        }
        return configuration
    }()
    
    // MARK: - Base URL
    static var baseURL: String {
        switch currentTarget {
        case .Marvel:
            return "https://gateway.marvel.com:443"
        }
    }
}
