//
//  EnvironmentType.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import OxeNetworking
import SwiftyJSON

public enum EnvironmentType: String, EnvironmentSpecifying, CaseIterable {
    case development, production, store

    public var name: String {
        return rawValue
    }

    public var baseURL: URL? {
        return nil
    }

    public var mayBeSimulated: Bool {
        return self != .store
    }
}
