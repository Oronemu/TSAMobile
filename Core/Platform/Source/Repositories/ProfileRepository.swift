//
//  ProfileRepository.swift
//  Platform
//
//  Created by Ivan on 27.05.2024.
//

import Foundation

public protocol ProfileRepositoryProtocol: AnyObject {
    func getMyProfile() -> Profile?
    
    func changePassword(_ old: String, new: String) async throws
    func changeName(_ new: String) async throws
    func changeEmail(_ new: String) async throws
    func changePhoneNumber(_ new: String) async throws
}

final class ProfileRepository: BaseRepository {
    private var currentProfile: Profile?
}

extension ProfileRepository: ProfileRepositoryProtocol {
    
    func getMyProfile() -> Profile? {
        return currentProfile
    }
    
    func changePassword(_ old: String, new: String) async throws {
        
    }
    
    func changeName(_ new: String) async throws {
        
    }
    
    func changeEmail(_ new: String) async throws {
        
    }
    
    func changePhoneNumber(_ new: String) async throws {
        
    }
}

