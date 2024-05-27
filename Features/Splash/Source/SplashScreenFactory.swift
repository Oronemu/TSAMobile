//
//  SplashScreenFactory.swift
//  Splash
//
//  Created by Ivan on 24.04.2024.
//

import Foundation
import Swinject
import UIKit
import SwiftUI
import Platform

public protocol SplashScreenFactory {
    func makeSplashViewHC() -> UIViewController
    func makeSplashView() -> AnyView
}

public final class SplashScreenFactoryImpl {
    let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension SplashScreenFactoryImpl: SplashScreenFactory {
    
    @MainActor
    public func makeSplashViewHC() -> UIViewController {
        let viewModel = SplashScreenViewModel(authService: container.resolve(AuthService.self)!)
        let view = SplashScreenView(viewModel: viewModel)
        
        let hc = UIHostingController(rootView: view)
        
        return hc
    }
    
    @MainActor
    public func makeSplashView() -> AnyView{
        let viewModel = SplashScreenViewModel(authService: container.resolve(AuthService.self)!)
        let view = SplashScreenView(viewModel: viewModel)
            
        return AnyView(view)
    }
}
