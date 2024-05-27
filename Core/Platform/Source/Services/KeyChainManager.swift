//
//  KeyChainManager.swift
//  Platform
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Security

public struct KeychainManager {
    public static func set<T>(_ value: T, forKey key: String) where T: Encodable {
        if let encoded = try? JSONEncoder().encode(value) {
            set(encoded, forKey: key)
        }
    }
    
    public static func get<T>(forKey key: String) -> T? where T: Decodable {
        guard let data = get(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    public static func set(_ value: Data, forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: value
        ]
        
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
    
    public static func get(forKey key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            return dataTypeRef as? Data
        }
        
        return nil
    }
    
    public static func setValue(_ value: Any, forKey key: String) {
        if let data = "\(value)".data(using: .utf8) {
            set(data, forKey: key)
        }
    }
    
    public static func getValue(forKey key: String) -> Any? {
        guard let data = get(forKey: key), let string = String(data: data, encoding: .utf8) else {
            return nil
        }
        return string
    }
    
    public static func setArray<T>(_ value: [T], forKey key: String) where T: Encodable {
        if let data = try? JSONEncoder().encode(value) {
            set(data, forKey: key)
        }
    }
    
    public static func getArray<T>(forKey key: String) -> [T]? where T: Decodable {
        guard let data = get(forKey: key) else { return nil }
        return try? JSONDecoder().decode([T].self, from: data)
    }
    
    public static func appendValue<T>(_ value: T, toArrayWithKey key: String) where T: Encodable, T: Decodable {
        var array = getArray(forKey: key) ?? [T]()
        array.append(value)
        setArray(array, forKey: key)
    }
    
    public static func removeValue<T: Equatable & Encodable & Decodable>(_ value: T, fromArrayWithKey key: String) {
        var array = getArray(forKey: key) ?? [T]()
        if let index = array.firstIndex(of: value) {
            array.remove(at: index)
            setArray(array, forKey: key)
        }
    }

    public static func removeObject(forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        SecItemDelete(query as CFDictionary)
    }
}
