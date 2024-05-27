//
//  WebSocketRequestProtocol.swift
//  NetworkProvider
//
//  Created by Ivan on 27.05.2024.
//

import Foundation

public protocol WebSocketRequest {
    associatedtype Response: Decodable
    var url: String { get }
    var message: String { get }
    func decode(_ data: Data) throws -> Response
}

public extension WebSocketRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}
