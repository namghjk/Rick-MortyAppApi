//
//  Endpoint.swift
//  ApiApp
//
//  Created by Nam Pham on 24/01/2023.
//

import Foundation


/// Represents unique API Endpoint
@frozen enum Endpoint: String{
    case character // Character info
    case location // Location info
    case episode // Episode info
}
