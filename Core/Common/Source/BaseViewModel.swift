//
//  BaseViewModel.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import SwiftUI

@MainActor
public protocol BaseViewModelProtocol: ObservableObject {
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
}

open class BaseViewModel {
    
    public init() {}
    
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
}
