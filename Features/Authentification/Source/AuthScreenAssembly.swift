//
//  ChatsAssembly.swift
//  Chats
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Swinject

public class AuthScreenAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(AuthScreenFactory.self) { r in
            AuthScreenFactoryImpl(container: container)
        }
    }
}
