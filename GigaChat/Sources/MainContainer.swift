//
//  MainContainer.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import UIKit
import SwiftUI
import Swinject

import Auth
import Platform

public class MainContainer {
        
    fileprivate var container: Container!
    private var assembler: Assembler!
    
    // MARK: - initial
    
    public init()
    {
        container = Container()
        
        assembler = Assembler(container: container)
        assembler.apply(assemblies: [
            ServiceAssembly(),
            RepositoryAssembly(),
            AuthScreenAssembly(),
        ])
    }
    
    func auth() -> AnyView {
        let factory = container.resolve(AuthScreenFactory.self)!
        return factory.makeAuthView()
    }
}


