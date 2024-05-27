//
//  SplashRouter.swift
//  Splash
//
//  Created by Ivan on 24.04.2024.
//

import Foundation
import SwiftUI
import Authentification

protocol SplashRouter {
    func openAuthScreen() -> AnyView
}

class SplashRouterImpl {
    let factory: AuthScreenFactory
    
    init(factory: AuthScreenFactory) {
        self.factory = factory
    }
}

extension SplashRouterImpl: SplashRouter {
    func openAuthScreen() -> AnyView {
        let view = factory.makeRegistryView()
        return view
    }
}

