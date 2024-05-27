//
//  EmptyAnalyzeViewModel.swift
//  Analyze
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Common

class EmptyAnalyzeViewModel: BaseViewModel, AnalyzeViewModelProtocol {
    func attachFile(_ url: URL) {
        
    }
    
    var attachedFile: URL?
    
    
}
