//
//  Request.swift
//  ApiApp
//
//  Created by Nam Pham on 24/01/2023.
//


import Foundation

//this represents for single request
final class Request {
    //Base URL
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    //Desired endponit
    private let endpoint: Endpoint
    
    //Path components for API, if any
    private let pathComponents: Set<String>
    
    //Querry arguments for API if any
    private let queryParameters: [URLQueryItem]
    
    
    /// Construct URL for API request
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
           string += argumentString
        }
        
        
        return string
    }
    
    /// The last step construct api URL
    public var url : URL?{
        return URL(string: urlString)
    }
    
    /// http Method for API Request
    public let httpMethod = "GET"
    
    //-MARK: public
    
    /// Construct request API
    /// - Parameters:
    ///   - endpoint: Expectedf endpont
    ///   - pathComponents: collection of pathComponents
    ///   - queryParameters: collection of queryParameters
    public init(endpoint: Endpoint,
         pathComponents: Set<String> = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
}
