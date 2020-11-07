//
//  APIConfiguration.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import Foundation

// MARK: - API Configuration

enum APIConfiguration {
    
    static let URLApi = "api"
    static let baseURL = "https://\(URLApi).github.com"
    
    static func baseSearchURL(_ login: String) -> String {
        
        return baseURL + "/search/users?q=\(login)+in:login&page=1&per_page=100"
    }
}
