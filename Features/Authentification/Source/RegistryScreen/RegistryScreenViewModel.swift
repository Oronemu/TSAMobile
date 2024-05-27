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
import SwiftUI

protocol RegistryScreenViewModelProtocol: BaseViewModelProtocol {
   
    func register(username: String, email: String, password: String) async throws
    func openVerify() -> AnyView?
    func openAuth() -> AnyView?
}

final class RegistryScreenViewModel: BaseViewModel, RegistryScreenViewModelProtocol {
    
    private var service: AuthServiceProtocol
    var router: AuthRouter?
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func register(username: String, email: String, password: String) async {
        isLoading = true
        do {
            try await service.register(username, email: email, password: password)
//            router.openVerifyScreen()
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    func openVerify() -> AnyView? {
        return router?.openVerify()
    }
    
    func openAuth() -> AnyView? {
        return router?.openAuth()
    }
}
