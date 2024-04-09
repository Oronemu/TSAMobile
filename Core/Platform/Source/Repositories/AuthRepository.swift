//
//  ChatsRepository.swift
//  Platform
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Common

public protocol AuthRepositoryProtocol: AnyObject {
    func register(_ username: String, password: String) async
    func login(_ username: String, password: String) async
    func changePassword(old: String, new: String) async
}

final class AuthRepository: BaseRepository {}

extension AuthRepository: AuthRepositoryProtocol {
    func register(_ username: String, password: String) async {
        
    }
    
    func login(_ username: String, password: String) async {
        
    }
    
    func changePassword(old: String, new: String) async {
        
    }
}
