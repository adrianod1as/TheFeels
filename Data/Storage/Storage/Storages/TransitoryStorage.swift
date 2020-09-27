//
//  TransitoryStorage.swift
//  Storage
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation

public class TransitoryStorage: UserDefaultsStoring {

    public let userDefaults: UserDefaults

    public enum ValueKeyable: String, Keyable, CaseIterable {
        case hasLaunched
        case hasSavedBiometric
        case hasBeenAskedForBiometrics

        public var key: String {
            return rawValue
        }

    }

    public required init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    public required init(suitName: String) {
        self.userDefaults = UserDefaults(suiteName: suitName) ?? .standard
    }

    public var hasLauched: Bool {
        return get(Bool.self, keyable: .hasLaunched, userId: nil) ?? false
    }
}
