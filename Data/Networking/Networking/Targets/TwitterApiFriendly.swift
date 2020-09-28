//
//  TwitterApiFriendly.swift
//  Networking
//
//  Created by Adriano Dias on 28/09/20.
//

import OxeNetworking
import Moya

import Foundation
import Moya
import OxeNetworking

public protocol TwitterApiFriendly: SampleHeadersReturning, HigherLayerHeadersSpecifyable, KeyPathable {

}

extension TwitterApiFriendly {

    // swiftlint:disable force_https
    public var baseURL: URL {
        return URL(string: "https://api.twitter.com/")!
    }

    public var specificHeaderTypes: [HeaderSpecifying] {
        return [SpecificHeaderType.twitter]
    }

    public var keyPathForData: String? {
        return nil
    }

    public var validationType: ValidationType {
        return .successAndRedirectCodes
    }

    public var headers: Headers {
        return nil
    }
}
