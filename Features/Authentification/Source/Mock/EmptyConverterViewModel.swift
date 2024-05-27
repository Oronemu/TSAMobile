//
//  EmptyConverterViewModel.swift
//  Chats
//
//  Created by Ivan on 12.01.2024.
//

import Foundation
import Common
import SwiftUI

class EmptyRegistryViewModel: BaseViewModel, RegistryScreenViewModelProtocol {
    
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
