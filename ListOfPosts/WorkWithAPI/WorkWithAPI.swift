//
//  ParseUser.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 13.12.2021.
//

import Foundation

class WorkWithAPI {
    
//    MARK: parse API
    
    func parsePost(jsonData: Data, onSuccess: @escaping([Post]) -> Void, onError: @escaping() -> Void) {
        do {
            let decodedData = try JSONDecoder().decode([Post].self,
                                                       from: jsonData)
            
            onSuccess(decodedData)
        } catch {
            onError()
//            print(error.localizedDescription)
        }
    }
    
    func parseUser(jsonData: Data, onSuccess: @escaping([User]) -> Void, onError: @escaping() -> Void) {
        do {
            let decodedData = try JSONDecoder().decode([User].self,
                                                       from: jsonData)
            
            onSuccess(decodedData)
    } catch {
            onError()
//            print(error.localizedDescription)
        }
    }
    
    func parseComment(jsonData: Data, onSuccesss: @escaping([Comments]) -> Void, onError: @escaping() -> Void) {
        do {
            let decodedData = try JSONDecoder().decode([Comments].self,
                                                       from: jsonData)
            
           onSuccesss(decodedData)
        } catch {
            onError()
//            print(error.localizedDescription)
        }
    }
    
    func getApiData(fromUrlString urlString: String,
                    completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }
}

