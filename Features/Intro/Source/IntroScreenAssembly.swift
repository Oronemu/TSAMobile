//
//  AnalyzeScreenAssembly.swift
//  Analyze
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Swinject

public class IntroScreenAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(IntroScreenFactory.self) { r in
            IntroScreenFactoryImpl(container: container)
        }
    }
}

