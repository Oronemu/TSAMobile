//
//  ErrorResponse.swift
//  Platform
//
//  Created by Ivan on 27.05.2024.
//

import Foundation

struct ErrorResponse: Decodable {
    var detail: [Detail]
    
    struct Detail: Decodable {
        var message: String
    }
}
