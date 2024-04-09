//
//  CurrencyRequest.swift
//  Platform
//
//  Created by Ivan on 12.01.2024.
//

import Foundation
import NetworkProvider
import Common

public struct AuthRequest: DataRequest {
    public var queryItems: [String : String]
    
    public init(queryItems: [String : String]) {
        self.queryItems = queryItems
    }
    
    public var url: String {
        let baseURL: String = NetworkConst.scheme + NetworkConst.host
        let path: String = NetworkConst.path
        return baseURL + path
    }
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public func decode(_ data: Data) throws -> UserDTO {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(UserDTO.self, from: data)
        return response
    }
}

public struct UserDTO: Decodable {
    var name: String
}
