//
//  User.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import Foundation

struct User: Decodable {
    let items: [Item]
}

struct Item: Codable {
    
    let login: String?
    let avatarUrl: String?
    let type: String?
}
