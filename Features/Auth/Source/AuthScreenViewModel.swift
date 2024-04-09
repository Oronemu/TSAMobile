//
//  ChatsViewModel.swift
//  Chats
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Platform
import NetworkProvider
import Common

protocol AuthScreenViewModelProtocol: BaseViewModelProtocol {
   
    func register(username: String, password: String) async
    func login(username: String, password: String) async
    func changePassword(old: String, new: String) async
}

final class AuthScreenViewModel: BaseViewModel, AuthScreenViewModelProtocol {
    
    private var service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func register(username: String, password: String) async {
        
    }
    
    func login(username: String, password: String) async {
        
    }
    
    func changePassword(old: String, new: String) async {
        
    }
}
