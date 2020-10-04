//
//  OAuthHandlerStub.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 03/10/20.
//

@testable import Networking

class OAuthHandlerSpy: OAuthHandling {

    func authorize(request: URLRequest) throws -> URLRequest {
        request
    }
}
