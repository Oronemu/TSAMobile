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
import Common

import Authentification
import Platform
import Analyze
import Intro
import Main
//import Splash

public class MainContainer {
        
    fileprivate var container: Container!
    private var assembler: Assembler!
        
    public init()
    {
        container = Container()
        
        assembler = Assembler(container: container)
        assembler.apply(assemblies: [
            ServiceAssembly(),
            RepositoryAssembly(),
            AuthScreenAssembly(),
            AnalyzeScreenAssembly(),
            IntroScreenAssembly(),
            MainScreenAssembly()
//            SplashScreenAssembly()
        ])
    }
    
    func auth() -> AnyView {
        let introFactory = container.resolve(IntroScreenFactory.self)!
        let mainFactory = container.resolve(MainScreenFactory.self)!
        
        let isLogged = UserDefaultsManager.getValue(forKey: ConstStatus.logStatus) as? Bool ?? false

        if isLogged {
            return mainFactory.makeMainScreen()
        } else {
            return introFactory.openIntroScreen()
        }
    }
}


