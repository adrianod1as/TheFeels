//
//  OAuthHandlerSpy.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 03/10/20.
//

@testable import Networking

class OAuthHandlerSpy: OAuthHandling {

    var authorizeRequestCalled = false

    func authorize(request: URLRequest) throws -> URLRequest {
        authorizeRequestCalled.toggle()
        return request
    }
}
