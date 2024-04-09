//
//  ApplicationError.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import Foundation

public protocol ApplicationError: Error {
    
    var title: String { get }
    var message: String { get }
    var log: String { get }
    var code: Int  { get }
}

extension ApplicationError {
    
    public var title: String {
        return ""
    }
    
    public var message: String {
        return ""
    }
    
    public var log: String {
        return ""
    }
    
    public var code: Int  {
        return -1
    }
}
