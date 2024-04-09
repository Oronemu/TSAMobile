//
//  CryptoCurrencyService.swift
//  Platform
//
//  Created by Ivan on 12.01.2024.
//

import Foundation

public protocol AuthServiceProtocol {
    func register(_ username: String, password: String) async
    func login(_ username: String, password: String) async
    func changePassword(old: String, new: String) async
}

public class AuthService: AuthServiceProtocol {
    
    let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    public func register(_ username: String, password: String) async {
        
    }
    
    public func login(_ username: String, password: String) async {
        
    }
    
    public func changePassword(old: String, new: String) async {
        
    }
}
