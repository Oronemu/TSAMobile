//
//  Profile.swift
//  Platform
//
//  Created by Ivan on 27.05.2024.
//

import Foundation

public struct Profile: Decodable {
    
    public init() {}
    
    public var username: String = ""
    public var fullName: String = ""
    public var password: String = ""
    public var phoneNumber: String = ""
    public var email: String = ""
}
