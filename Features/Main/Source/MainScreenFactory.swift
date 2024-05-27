//
//  MainScreenFactory.swift
//  Main
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Swinject
import SwiftUI
import Analyze

public protocol MainScreenFactory {
    func makeMainScreen() -> AnyView
}

final class MainScreenFactoryImpl {
    let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension MainScreenFactoryImpl: MainScreenFactory {
    
    @MainActor
    func makeMainScreen() -> AnyView {
        let viewModel = MainScreenViewModel()
        let router = MainScreenRouterImpl(factory: container.resolve(AnalyzeScreenFactory.self)!)
        viewModel.router = router
        let view = MainScreen(viewModel: viewModel)
        return AnyView(view)
    }
}

