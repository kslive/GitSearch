//
//  Repositories.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import Foundation

struct Repositories: Codable {
    
    let login: String?
    let avatarUrl: String?
    let name: String?
    let location: String?
    var createdAt: String?
}

struct RepositoriesCountElement: Codable {
    let name: String?
    let updatedAt: String?
    let stargazersCount: Int?
    let language: String?
}

