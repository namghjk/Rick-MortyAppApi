//
//  GetAllCharacterResponse.swift
//  ApiApp
//
//  Created by Nam Pham on 31/01/2023.
//

import Foundation

struct GetAllCharaterResponse: Codable{
    
    struct Info: Codable{
        let count: Int
        let next: String?
        let pages: Int
        let prev: String?
    }
    
    let info:Info
    let results:[Character]
}
