//
//  ApplicationError.swift
//  Common
//
//  Created by Ivan on 28.05.2024.
//

import Foundation

public protocol ApplicationError: Error {
    
    var title: String { get }
    var message: String { get }
    var code: Int  { get }
    var detail: Detail? { get }
}

extension ApplicationError {
    
    public var title: String {
        return ""
    }
    
    public var message: String {
        return ""
    }
    
    public var code: Int  {
        return -1
    }
    
    public var detail: Detail? {
        return nil
    }
}
