//
//  ServiceAssembly.swift
//  Platform
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Swinject
import NetworkProvider

public class ServiceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(NetworkManager.self) { r in
            DefaultNetworkManager()
        }
        container.register(AuthService.self) { r in
            AuthService(authRepository: r.resolve(AuthRepository.self)!)
        }
    }
}
