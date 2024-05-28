//
//  TokenResponse.swift
//  Common
//
//  Created by Ivan on 28.05.2024.
//

import Foundation

public struct TokenResponse: Decodable {
    public var token: String
    public var refreshToken: String
}
