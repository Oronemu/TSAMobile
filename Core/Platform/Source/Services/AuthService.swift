//
//  CryptoCurrencyService.swift
//  Platform
//
//  Created by Ivan on 12.01.2024.
//

import Foundation
import Common

public protocol AuthServiceProtocol {
    func register(_ username: String, email: String, password: String) async throws
    func login(_ username: String, password: String) async throws
    func setLogStatus(status: Bool) 
    func signout()
    func isLogged() -> Bool
}

public class AuthService: AuthServiceProtocol {
    
    let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    public func isLogged() -> Bool {
        guard let status = UserDefaultsManager.getValue(forKey: ConstStatus.logStatus) as? Bool else { return false }
        return status
    }
    
    public func register(_ username: String, email: String, password: String) async throws{
        
    }
    
    public func login(_ username: String, password: String) async throws {
        do {
            try await authRepository.login(username, password: password)
            setLogStatus(status: true)
        } catch {
            
        }
    }
    
    public func signout() {
        setLogStatus(status: false)
    }
    
    public func setLogStatus(status: Bool) {
        UserDefaultsManager.setValue(status, forKey: ConstStatus.logStatus)
    }
}
