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

public protocol AnalyzeScreenFactory: AnyObject {
    func openAnalyzeScreen() -> AnyView
}

final class AnalyzeScreenFactoryImpl {
    let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension AnalyzeScreenFactoryImpl: AnalyzeScreenFactory {
    
    @MainActor
    func openAnalyzeScreen() -> AnyView {
        let viewModel = AnalyzeViewModel()
        let view = AnalyzeScreen(viewModel: viewModel)
        
        return AnyView(view)
    }
}
