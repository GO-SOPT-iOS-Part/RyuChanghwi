//
//  UserDefaultManager.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import Foundation

class UserDefaultManager {
    enum Key : String {
        case hasOnboarded
    }
    let defaults = UserDefaults.standard
    static let shared = UserDefaultManager()
    
    var hasOnboarded : Bool {
        if load(.hasOnboarded) == nil {
            save(value: false, forkey: .hasOnboarded)
            return true
        } else {
            return false
        }
    }
    func save( value: Any, forkey key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func load(_ key : Key) -> Any? {
        switch key {
        case .hasOnboarded:
            return loadBool(key)
        }
    }
    func loadBool(_ key: Key) -> Bool? {
        return defaults.object(forKey: key.rawValue) as? Bool
    }
}
