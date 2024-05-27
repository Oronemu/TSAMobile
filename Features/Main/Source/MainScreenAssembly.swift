//
//  MainScreenAssembly.swift
//  Main
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Swinject

public class MainScreenAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(MainScreenFactory.self) { r in
            MainScreenFactoryImpl(container: container)
        }
    }
}
