//
//  UserDefaultsManager.swift
//  Platform
//
//  Created by Ivan on 10.04.2024.
//

import Foundation

public struct UserDefaultsManager {
    public static var userDefaults: UserDefaults = .standard
    
    public static func set<T>(_ value: T, forKey: String) where T: Encodable {
        if let encoded = try? JSONEncoder().encode(value) {
            userDefaults.set(encoded, forKey: forKey)
        }
    }
    
    public static func get<T>(forKey: String) -> T? where T: Decodable {
        guard let data = userDefaults.value(forKey: forKey) as? Data,
              let decodedData = try? JSONDecoder().decode(T.self, from: data)
        else { return nil }
        return decodedData
    }
    
    public static func setValue(_ value: Any, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    public static func getValue(forKey key: String) -> Any? {
        return userDefaults.value(forKey: key)
    }
    
    public static func setArray<T>(_ value: [T], forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    public static func getArray<T>(forKey key: String) -> [T]? {
        return userDefaults.array(forKey: key) as? [T]
    }
    
    public static func appendValue<T>(_ value: T, toArrayWithKey key: String) {
        var array = getArray(forKey: key) ?? [T]()
        array.append(value)
        setArray(array, forKey: key)
    }
    
    public static func removeValue<T: Equatable>(_ value: T, fromArrayWithKey key: String) {
        var array = getArray(forKey: key) ?? [T]()
        if let index = array.firstIndex(of: value) {
            array.remove(at: index)
            setArray(array, forKey: key)
        }
    }

    public static func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}

