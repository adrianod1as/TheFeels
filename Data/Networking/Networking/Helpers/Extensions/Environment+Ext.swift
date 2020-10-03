//
//  Environment+Ext.swift
//  Networking
//
//  Created by Adriano Dias on 02/10/20.
//

import OxeNetworking
import OAuthSwift

public extension Environment {

    var oauth1Swift: OAuth1Swift? {
        specificHeaders.oauth1Swift
    }
}
