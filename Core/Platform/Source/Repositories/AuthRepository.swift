//
//  ChatsRepository.swift
//  Platform
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Common

public protocol AuthRepositoryProtocol: AnyObject {
    func register(_ username: String, password: String) async throws
    func login(_ username: String, password: String) async throws
}

final class AuthRepository: BaseRepository {}

extension AuthRepository: AuthRepositoryProtocol {
    func register(_ username: String, password: String) async throws {
        let queryItems: [String: String] = [
            "username": username,
            "password": password,
            "email": "user@example.com",
            "full_name": "Иванов Иван Иванович",
            "phone_number": "+79990000000"
        ]

        let createUserRequest = CreateUserRequest(queryItems: queryItems)
        
        let response = try await networkManager.request(createUserRequest)
    }
    
    func login(_ username: String, password: String) async throws {
        
    }
}
