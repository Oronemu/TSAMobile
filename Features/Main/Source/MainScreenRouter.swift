//
//  MainScreenRouter.swift
//  Main
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Analyze
import SwiftUI

protocol MainScreenRouter {
    func openAnalyzeView() -> AnyView
}

class MainScreenRouterImpl {
    let factory: AnalyzeScreenFactory
    
    
    init(factory: AnalyzeScreenFactory) {
        self.factory = factory
    }
}

extension MainScreenRouterImpl: MainScreenRouter {
    func openAnalyzeView() -> AnyView {
        let view = factory.openAnalyzeScreen()
        return AnyView(view)
    }
}

