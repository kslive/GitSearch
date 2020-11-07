//
//  User.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import Foundation

struct User {
    
    var login: String
    var type:String
    var avatarUrl: String
    var name: String?
    var createdAt: String?
    var location: String?
    var repos: [Repositories]?
}
