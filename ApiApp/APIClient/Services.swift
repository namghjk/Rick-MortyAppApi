//
//  Services.swift
//  ApiApp
//
//  Created by Nam Pham on 24/01/2023.
//

import Foundation

/// Primary Api request, call to get data Rick&Morty
final class Services{
    static let shared = Services()
    
    /// Constructor
    private init(){}
    
    
    enum ServicesError: Error{
        case failedToCreateRequest
        case faileToGetData
    }
    
    /// Send API call
    /// - Parameters:
    ///   - request: request instance
    ///   - type: the type of object we expect to get
    ///   - completion: callback with data or error
    public func execute<T:Codable>(
        _ request: Request,
        expecting type : T.Type,
        completion: @escaping (Result<T,Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServicesError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data ,error == nil else {
                completion(.failure(error ?? ServicesError.faileToGetData))
                return
            }
            
        //Decode response
            do{
                
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
            
            
        }
        task.resume()
    }
    
    // MARK:- Private
    
    private func request(from rmRequest: Request) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request =  URLRequest(url: url)
        
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
