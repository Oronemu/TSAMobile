//
//  CurrencyRequest.swift
//  Platform
//
//  Created by Ivan on 12.01.2024.
//

import Foundation
import NetworkProvider
import Common

public struct CreateUserRequest: DataRequest {
    public var queryItems: [String : String]
    
    public init(queryItems: [String : String]) {
        self.queryItems = queryItems
    }
    
    public var url: String {
        let baseURL: String = ConstNetwork.scheme + ConstNetwork.host
        let path: String = ConstNetwork.path
        return baseURL + path + "/user"
    }
    
    public var method: HTTPMethod {
        return .POST
    }
    
    public func decode(_ data: Data) throws -> Profile {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(Profile.self, from: data)
        return response
    }
}
