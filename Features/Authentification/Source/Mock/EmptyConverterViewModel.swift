//
//  EmptyConverterViewModel.swift
//  Chats
//
//  Created by Ivan on 12.01.2024.
//

import Foundation
import Common
import SwiftUI
import Platform

class EmptyRegistryViewModel: BaseViewModel, RegistryScreenViewModelProtocol {
    var profile: Profile = .init()
    
    func openVerify() -> AnyView? {
        return nil
    }
    
    func openAuth() -> AnyView? {
        return nil
    }
    
    func register(username: String, email: String, password: String) async throws {
        
    }
    
    func login(username: String, password: String) async {
        
    }
    
    func changePassword(old: String, new: String) async {
        
    }
}
