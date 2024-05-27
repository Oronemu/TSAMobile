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

protocol AnalyzeViewModelProtocol: BaseViewModelProtocol {
    func attachFile(_ url: URL)
    var attachedFile: URL? { get }
}

final class AnalyzeViewModel: BaseViewModel, AnalyzeViewModelProtocol {
    @Published private(set) var attachedFile: URL?
        
    func attachFile(_ url: URL) {
        attachedFile = url
    }
}
