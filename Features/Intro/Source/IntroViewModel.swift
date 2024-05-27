//
//  AnalyzeViewModel.swift
//  Analyze
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Combine
import SwiftUI
import Common

protocol IntroScreenViewModelProtocol: BaseViewModelProtocol {
    func openRegistration() -> AnyView?
}

final class IntroScreenViewModel: BaseViewModel, IntroScreenViewModelProtocol {
        
    var router: IntroRouter?
    
    func openRegistration() -> AnyView? {
        return router?.openRegistration()
    }
}
