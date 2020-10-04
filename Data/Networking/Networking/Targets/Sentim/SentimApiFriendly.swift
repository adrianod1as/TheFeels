//
//  SentimApiFriendly.swift
//  Networking
//
//  Created by Adriano Dias on 04/10/20.
//

import OxeNetworking
import Moya

public protocol SentimApiFriendly: SampleHeadersReturning, HigherLayerHeadersSpecifyable, KeyPathable {

}

extension SentimApiFriendly {

    // swiftlint:disable force_https
    public var baseURL: URL {
        return URL(string: "https://sentim-api.herokuapp.com")!
    }

    public var specificHeaderTypes: [HeaderSpecifying] {
        return [SpecificHeaderType.sentimKey]
    }

    public var keyPathForData: String? {
        return "result"
    }

    public var validationType: ValidationType {
        return .successAndRedirectCodes
    }

    public var headers: Headers {
        return nil
    }
}
