//
//  SpecificHeaderType+Ext.swift
//  Networking
//
//  Created by Adriano Dias on 02/10/20.
//

import OxeNetworking
import OAuthSwift

extension SpecificHeaders {

    var authHeaders: Headers {
        self[SpecificHeaderType.apiKeyAndSecret.key] ?? [:]
    }

    var apiKey: String? {
        authHeaders?[TwitterAuhHeaders.apiKey.rawValue]
    }

    var apiKeySecret: String? {
        authHeaders?[TwitterAuhHeaders.apiSecret.rawValue]
    }

    var accessToken: String? {
        authHeaders?[TwitterAuhHeaders.accessToken.rawValue]
    }

    var accessTokenSecret: String? {
        authHeaders?[TwitterAuhHeaders.accessTokenSecret.rawValue]
    }

    var oauth1Swift: OAuth1Swift? {
        guard let key = apiKey, let secret = apiKeySecret else {
            return nil
        }
        let oauth = OAuth1Swift(consumerKey: key, consumerSecret: secret)
        oauth.client.credential.oauthTokenSecret = accessTokenSecret ?? String()
        oauth.client.credential.oauthToken = accessToken ?? String()
        return oauth
    }

}
