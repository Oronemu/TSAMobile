//
//  AuthScreenViewModel.swift
//  Authentification
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Platform
import NetworkProvider
import Common
import SwiftUI

protocol AuthScreenViewModelProtocol: BaseViewModelProtocol {
   
    func login(username: String, password: String) async throws
    
    func openMain() -> AnyView?
}

final class AuthScreenViewModel: BaseViewModel, AuthScreenViewModelProtocol {
    
    private var service: AuthServiceProtocol
    var router: AuthRouter?
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func login(username: String, password: String) async {
        isLoading = true
        do {
            try await service.login(username, password: password)
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    func openMain() -> AnyView? {
        service.setLogStatus(status: true)
        return router?.openMain()
    }
}

