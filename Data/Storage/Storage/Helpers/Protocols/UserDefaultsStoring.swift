//
//  UserDefaultsStoring.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public protocol UserDefaultsStoring {

    associatedtype ValueKeyable: Keyable
    var userDefaults: UserDefaults { get }
    init(userDefaults: UserDefaults)
    init(suitName: String)

    func set(_ value: Any?, keyable: ValueKeyable, userId: String?)
    func removeItem(keyable: ValueKeyable, userId: String?)
    func get(keyable: ValueKeyable, userId: String?) -> Any?
    func get<T>(_ type: T.Type, keyable: ValueKeyable, userId: String?) -> T?
}

extension UserDefaultsStoring {

    internal func getKey(keyable: ValueKeyable, userId: String?) -> String {
        guard let userId = userId, !userId.isEmpty else {
            return keyable.key
        }
        return "\(userId)-\(keyable.key)"
    }

    public func set(_ value: Any?, keyable: ValueKeyable, userId: String?) {
        let key = getKey(keyable: keyable, userId: userId)
        userDefaults.set(value, forKey: key)
    }

    public func removeItem(keyable: ValueKeyable, userId: String?) {
        let key = getKey(keyable: keyable, userId: userId)
        userDefaults.removeObject(forKey: key)
    }

    public func get(keyable: ValueKeyable, userId: String?) -> Any? {
        let key = getKey(keyable: keyable, userId: userId)
        return userDefaults.object(forKey: key)
    }

    public func get<T>(_ type: T.Type, keyable: ValueKeyable, userId: String?) -> T? {
        let key = getKey(keyable: keyable, userId: userId)
        return userDefaults.object(forKey: key) as? T
    }
}
