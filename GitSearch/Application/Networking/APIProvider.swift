//
//  APIProvider.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import Foundation
import Moya

enum APIProvider {
    
    case getUserDetails(login: String)
    case getUserRepositories(login: String)
    case getUserSearch(login: String)
}

extension APIProvider: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getUserSearch(let login): return URL(string: APIConfiguration.baseSearchURL(login))!
        default: return URL(string: APIConfiguration.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getUserDetails(let login): return "/users/\(login)"
        case .getUserRepositories(let login): return "/users/\(login)/repos"
            
        default: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserDetails(_), .getUserRepositories(_), .getUserSearch(_):
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getUserDetails(let login): return ["login": login]
        case .getUserRepositories(let login): return ["login": login]
        default: return [:]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        default: return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
}
