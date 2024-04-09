//
//  RepositoriesAssembly.swift
//  Platform
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Swinject
import NetworkProvider

public class RepositoryAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(AuthRepository.self) { r in
            AuthRepository(network: r.resolve(NetworkManager.self)!, database: r.resolve(DataBaseManager.self)!)
        }
        container.register(DataBaseManager.self) { r in
            DataBaseManager()
        }
    }
}
