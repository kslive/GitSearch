//
//  NetworkManager.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 07.11.2020.
//

import UIKit
import Moya

class NetworkManager {
    
    private let provider = MoyaProvider<APIProvider>()
    
    static let shared = NetworkManager()
    
    private init(){}
    
    func fetchRequestUserSearch(text: String?, completion: @escaping ([Item]) -> ()) {
        
        guard let text = text else { return }
        
        provider.request(.getUserSearch(login: text)) { result in
            
            switch result {
            case .success(let response):
                
                do {
                    
                    let decoder = JSONDecoder()
                    
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let searchUsers = try decoder.decode(User.self, from: response.data).items
                    
                    completion(searchUsers)
                    
                } catch let error {
                    
                    print(error.localizedDescription)
                }
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchRequestUserProfile(login: String?, completion: @escaping (Repositories) -> ()) {
        
        guard let login = login else { return }
        
        provider.request(.getUserDetails(login: login)) { result in
            
            switch result {
            case .success(let response):
                
                do {
                    
                    let decoder = JSONDecoder()
                    
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let usersInfo = try decoder.decode(Repositories.self, from: response.data)
                    
                    DispatchQueue.main.async {
                        
                        completion(usersInfo)
                    }
                    
                } catch let error {
                    
                    print(error.localizedDescription)
                }
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchRequestUserRepositories(login: String?, completion: @escaping ([RepositoriesCountElement]) -> ()) {
        
        guard let login = login else { return }
        
        provider.request(.getUserRepositories(login: login)) { result in
            
            switch result {
            case .success(let response):
                
                do {
                    
                    let decoder = JSONDecoder()
                    
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let usersRepo = try decoder.decode([RepositoriesCountElement].self, from: response.data)
                    
                    DispatchQueue.main.async {
                        
                        completion(usersRepo)
                    }
                    
                } catch let error {
                    
                    print(error.localizedDescription)
                }
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
    }
}
