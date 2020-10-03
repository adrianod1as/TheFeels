//
//  OAuthHandling.swift
//  Networking
//
//  Created by Adriano Dias on 03/10/20.
//

public protocol OAuthHandling {

    func authorize(request: URLRequest) throws -> URLRequest
}
