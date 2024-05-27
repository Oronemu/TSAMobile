//
//  MainViewViewModel.swift
//  Main
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Common
import SwiftUI

protocol MainScreenViewModelProtocol: BaseViewModelProtocol {
    func openAnalyzeScreen() -> AnyView?
}

final class MainScreenViewModel: BaseViewModel, MainScreenViewModelProtocol {
        
    var router: MainScreenRouter?
    
    func openAnalyzeScreen() -> AnyView? {
        router?.openAnalyzeView()
    }
}
