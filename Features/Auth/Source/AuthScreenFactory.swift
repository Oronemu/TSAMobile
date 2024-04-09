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

public protocol AuthScreenFactory: AnyObject {
    func makeAuthView() -> AnyView
}

final class AuthScreenFactoryImpl {
    let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension AuthScreenFactoryImpl: AuthScreenFactory {
    
    @MainActor
    func makeAuthView() -> AnyView {
        let viewModel = AuthScreenViewModel(service: container.resolve(AuthService.self)!)
        let view = AuthScreen(viewModel: viewModel)
        
        return AnyView(view)
    }
}
