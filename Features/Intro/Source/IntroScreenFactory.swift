//
//  AnalyzeFactory.swift
//  Analyze
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import SwiftUI
import Swinject
import Platform
import Authentification

public protocol IntroScreenFactory: AnyObject {
    func openIntroScreen() -> AnyView
}

final class IntroScreenFactoryImpl {
    let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension IntroScreenFactoryImpl: IntroScreenFactory {
    
    @MainActor 
    func openIntroScreen() -> AnyView {
        let viewModel = IntroScreenViewModel()
        let router = IntroRouterImpl(factory: container.resolve(AuthScreenFactory.self)!)
        viewModel.router = router
        let view = IntroView(viewModel: viewModel, onBoardingisShowed: .constant(false))
        return AnyView(view)
    }
}
