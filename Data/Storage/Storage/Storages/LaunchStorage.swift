//
//  LaunchStorage.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public class LaunchStorage: UserDefaultsStoring {

    public let userDefaults: UserDefaults

    public enum ValueKeyable: Keyable, CaseIterable {
        case hasLaunched

        public var key: String {
            switch self {
            case .hasLaunched:
                return L10n.LaunchStorage.ValueKey.hasLaunched
            }
        }

    }

    public required init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    public required init(suitName: String) {
        self.userDefaults = UserDefaults(suiteName: suitName) ?? .standard
    }

    public var hasLaunched: Bool {
        return userDefaults.bool(forKey: ValueKeyable.hasLaunched.key)
    }

    public func recordFirstLaunch() {
        self.set(true, keyable: .hasLaunched, userId: nil)
    }

    public func clearFirstLaunch() {
        self.removeItem(keyable: .hasLaunched, userId: nil)
    }

}
