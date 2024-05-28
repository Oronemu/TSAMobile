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
    var name: String { get set }
    var password: String { get set }
    func login(username: String, password: String) async throws
    
    func openMain() -> AnyView?
}

final class AuthScreenViewModel: BaseViewModel, AuthScreenViewModelProtocol {
    
    @Published var name: String = ""
    @Published var password: String = ""
    
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
        Task {
            await self.login(username: name, password: password)
        }
        return router?.openMain()
    }
}

