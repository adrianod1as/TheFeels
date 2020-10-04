//
//  SpecificHeaderType.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import OxeNetworking

public enum SpecificHeaderType: String, HeaderSpecifying {
    case twiiterKeyAndSecret
    case twiiterBearerToken
    case sentimKey

    public var key: String {
        return rawValue
    }
}
