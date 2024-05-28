//
//  CryptoCurrencyService.swift
//  Platform
//
//  Created by Ivan on 12.01.2024.
//

import Foundation
import Common

public protocol AuthServiceProtocol {
    func register(_ profile: Profile) async throws
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
    
    public func register(_ profile: Profile) async throws{
        do {
            try await authRepository.register(profile)
        } catch {
            throw error
        }
    }
    
    public func login(_ username: String, password: String) async throws {
        do {
            try await authRepository.login(username, password: password)
            setLogStatus(status: true)
        } catch {
            throw error
        }
    }
    
    public func signout() {
        setLogStatus(status: false)
    }
    
    public func setLogStatus(status: Bool) {
        UserDefaultsManager.setValue(status, forKey: ConstStatus.logStatus)
    }
}
