//
//  SplashScreenViewModel.swift
//  TSA
//
//  Created by Ivan on 24.04.2024.
//

import Foundation
import Common
import Platform

protocol SplashScreenViewModelProtocol: BaseViewModelProtocol {
    func login()
}

final class SplashScreenViewModel: BaseViewModel, SplashScreenViewModelProtocol {
    
    private var authService: AuthServiceProtocol
    var router: SplashRouter?
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    func login() {
        let status = self.authService.isLogged()
        
    }
}
