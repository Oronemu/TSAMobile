//
//  EmptyAuthViewModel.swift
//  Authentification
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Common
import SwiftUI

class EmptyAuthViewModel: BaseViewModel, AuthScreenViewModelProtocol {
    func openMain() -> AnyView? {
        return nil
    }
    
    func login(username: String, password: String) async {
        
    }
}
