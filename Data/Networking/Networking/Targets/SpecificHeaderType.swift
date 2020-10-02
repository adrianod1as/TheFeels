//
//  SpecificHeaderType.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import OxeNetworking

public enum SpecificHeaderType: String, HeaderSpecifying {
    case apiKeyAndSecret
    case token

    public var key: String {
        return rawValue
    }
}

public enum TwitterAuhHeaders: String {
    case key
    case secret
}
