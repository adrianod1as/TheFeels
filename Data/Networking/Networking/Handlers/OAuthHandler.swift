//
//  OAuthHandler.swift
//  Networking
//
//  Created by Adriano Dias on 03/10/20.
//

import OAuthSwift

public class OAuthHandler {

    private let paramsLocation: OAuthSwiftHTTPRequest.ParamsLocation
    private let dataEncoding: String.Encoding
    private let oauthSwift: OAuthSwift

    public init(oauthSwift: OAuthSwift, dataEncoding: String.Encoding = .utf8,
                paramsLocation: OAuthSwiftHTTPRequest.ParamsLocation = .authorizationHeader) {
        self.oauthSwift = oauthSwift
        self.dataEncoding = dataEncoding
        self.paramsLocation = paramsLocation
    }
}

extension OAuthHandler: OAuthHandling {

    internal func config(for request: URLRequest) -> OAuthSwiftHTTPRequest.Config {
        OAuthSwiftHTTPRequest.Config(urlRequest: request,
                                     paramsLocation: paramsLocation,
                                     dataEncoding: dataEncoding)
    }

    public func authorize(request: URLRequest) throws -> URLRequest {
        var oauthConfig = config(for: request)
        oauthConfig.updateRequest(credential: oauthSwift.client.credential)
        return try OAuthSwiftHTTPRequest.makeRequest(config: oauthConfig)
    }
}
