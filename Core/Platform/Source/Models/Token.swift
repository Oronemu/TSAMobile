//
//  Token.swift
//  Platform
//
//  Created by Ivan on 28.05.2024.
//

import Foundation
import Common

public struct Token {
    
    public static func set(_ value: String?) {
        KeychainManager.set(value, forKey: ConstToken.token)
    }
    
    public static func get() -> String? {
        return KeychainManager.get(forKey: ConstToken.token)
    }
}
