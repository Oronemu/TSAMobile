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
    var profile: Profile { get set }
    
    func openVerify() -> AnyView?
    func openAuth() -> AnyView?
}

final class RegistryScreenViewModel: BaseViewModel, RegistryScreenViewModelProtocol {
    
    private var service: AuthServiceProtocol
    var router: AuthRouter?
    @Published var profile: Profile = .init()
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func openVerify() -> AnyView? {
        Task {
            await self.register(self.profile)
        }
        return router?.openVerify()
    }
    
    func openAuth() -> AnyView? {
        return router?.openAuth()
    }
    
    private func register(_ profile: Profile) async {
        isLoading = true
        do {
            try await service.register(profile)
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
