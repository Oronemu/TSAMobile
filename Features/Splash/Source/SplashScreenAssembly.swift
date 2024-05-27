//
//  SplashScreenAssembly.swift
//  Splash
//
//  Created by Ivan on 24.04.2024.
//

import Foundation
import Swinject

public class SplashScreenAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(SplashScreenFactory.self) { r in
            SplashScreenFactoryImpl(container: container)
        }
    }
}
