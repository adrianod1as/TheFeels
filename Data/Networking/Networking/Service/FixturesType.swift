//
//  FixturesType.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import OxeNetworking

public enum FixturesType: String, FixtureTypeSpecifying, CaseIterable {
    case object, json, none

    public var isEnabled: Bool {
        return self != .none
    }

    public var isJsonType: Bool {
        return self == .json
    }
}
