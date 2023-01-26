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
        
    }
}
