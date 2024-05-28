//
//  ChatsRepository.swift
//  Platform
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Common

public protocol AuthRepositoryProtocol: AnyObject {
    func register(_ profile: Profile) async throws
    func login(_ username: String, password: String) async throws
}

final class AuthRepository: BaseRepository {}

extension AuthRepository: AuthRepositoryProtocol {
    func register(_ profile: Profile) async throws {
        let request = ProfileRequest(queryItems: [
            "username": profile.username,
            "password": profile.password,
            "email": profile.email,
            "full_name": profile.fullName,
            "phone_number": profile.phoneNumber
        ])
        
        let _ = try await networkManager.request(request, allowRetry: true)
        
    }
    
    func login(_ username: String, password: String) async throws {
        let request = LoginRequest(queryItems: [
            "username": username,
            "password": password,
        ])
        
        let response = try await networkManager.request(request, allowRetry: true)
        Token.set(response.token)
    }
}
