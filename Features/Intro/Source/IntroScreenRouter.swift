//
//  IntroScreenRouter.swift
//  Intro
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Platform
import SwiftUI
import Authentification

protocol IntroRouter {
    func openRegistration() -> AnyView
}

class IntroRouterImpl {
    let factory: AuthScreenFactory
    
    
    init(factory: AuthScreenFactory) {
        self.factory = factory
    }
}

extension IntroRouterImpl: IntroRouter {
    func openRegistration() -> AnyView {
        let view = factory.makeRegistryView()
        return AnyView(view)
    }
}

