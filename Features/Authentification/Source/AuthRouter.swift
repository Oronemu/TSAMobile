//
//  AuthRouter.swift
//  Auth
//
//  Created by Ivan on 10.04.2024.
//

import Foundation
import Platform
import SwiftUI
import Main

protocol AuthRouter {
    func openVerify() -> AnyView
    func openAuth() -> AnyView
    func openMain() -> AnyView
}

class AuthRouterImpl {
    let authFactory: AuthScreenFactory
    let mainFactory: MainScreenFactory
    
    init(authFactory: AuthScreenFactory, mainFactory: MainScreenFactory) {
        self.authFactory = authFactory
        self.mainFactory = mainFactory
    }
}

extension AuthRouterImpl: AuthRouter {
    func openVerify() -> AnyView {
        let view = authFactory.makeVerifyView()
        return AnyView(view)
    }
    
    func openAuth() -> AnyView {
        let view = authFactory.makeAuthView()
        return AnyView(view)
    }
    
    func openMain() -> AnyView {
        let view = mainFactory.makeMainScreen()
        return AnyView(view)
    }
}

