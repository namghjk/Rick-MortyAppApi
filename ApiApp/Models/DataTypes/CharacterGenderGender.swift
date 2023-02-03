//
//  Gender.swift
//  ApiApp
//
//  Created by Nam Pham on 25/01/2023.
//

import Foundation

enum CharacterGender:String,Codable{
//    ('Female', 'Male', 'Genderless' or 'unknown').
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
