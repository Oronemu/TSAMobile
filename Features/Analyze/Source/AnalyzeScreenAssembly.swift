//
//  AnalyzeScreenAssembly.swift
//  Analyze
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Swinject

public class AnalyzeScreenAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(AnalyzeScreenFactory.self) { r in
            AnalyzeScreenFactoryImpl(container: container)
        }
    }
}

