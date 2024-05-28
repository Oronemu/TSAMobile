//
//  LoginRequest.swift
//  Common
//
//  Created by Ivan on 28.05.2024.
//

import Foundation

public struct LoginRequest: DataRequest {
    
    public typealias Response = TokenResponse
    
    public var url: String {
        let scheme = ConstNetwork.scheme
        let host = ConstNetwork.host
        let path = ConstNetwork.path + "/user"
        return scheme + host + path
    }
    
    public var method: HTTPMethod {
        return .POST
    }
    
    public var headers: [String: String] {
        return [
            "Content-Type": "application/json",
        ]
    }
    
    public var queryItems: [String: String]
    
    public init(queryItems: [String: String] = [:]) {
        self.queryItems = queryItems
    }
}

extension LoginRequest {
    public func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
