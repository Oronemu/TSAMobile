//
//  ChatsFactory.swift
//  Chats
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import SwiftUI
import Swinject
import Platform
import Main

public protocol AuthScreenFactory {
    func makeRegistryView() -> AnyView
    func makeAuthView() -> AnyView
    func makeVerifyView() -> AnyView
}

final class AuthScreenFactoryImpl {
    let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension AuthScreenFactoryImpl: AuthScreenFactory {
    
    @MainActor
    func makeRegistryView() -> AnyView {
        let router = AuthRouterImpl(authFactory: container.resolve(AuthScreenFactory.self)!,
                                    mainFactory: container.resolve(MainScreenFactory.self)!)
        let viewModel = RegistryScreenViewModel(service: container.resolve(AuthService.self)!)
        viewModel.router = router
        let view = RegistryScreen(viewModel: viewModel)
        
        return AnyView(view)
    }
    
    @MainActor 
    func makeAuthView() -> AnyView {
        let router = AuthRouterImpl(authFactory: container.resolve(AuthScreenFactory.self)!,
                                    mainFactory: container.resolve(MainScreenFactory.self)!)
        let viewModel = AuthScreenViewModel(service: container.resolve(AuthService.self)!)
        viewModel.router = router
        let view = AuthScreen(viewModel: viewModel)
        
        return AnyView(view)
    }
    
    @MainActor
    func makeVerifyView() -> AnyView {
        let viewModel = VerifyViewModel(service: container.resolve(AuthService.self)!)
        let view = VerifyScreen(viewModel: viewModel)

        return AnyView(view)
    }
}
