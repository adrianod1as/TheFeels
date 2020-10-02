//
//  UserSessionRequestHandler.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Moya
import Alamofire
import OxeNetworking
import OAuthSwift

public class UserSessionRequestHandler: Dispatcher, RequestInterceptor {

    public var environment: Environment
    private let errorFilter: ErrorFilter
    private let oauthSwift: OAuthSwift
    private let lock = NSLock()
    private var isRefreshing = false
    private var requestsToRetry: [(RetryResult) -> Void] = []
    public var paramsLocation: OAuthSwiftHTTPRequest.ParamsLocation = .authorizationHeader
    public var dataEncoding: String.Encoding = .utf8
    public var retryCount: Int = 0

    internal lazy var session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()

    internal lazy var provider: MoyaProvider<MultiTarget> = {
        let endpointClosure = { (target: MultiTarget) -> Endpoint in
            return Endpoint.from(target: target, inEnvironment: self.environment)
        }
        let provider = MoyaProvider<MultiTarget>(endpointClosure: endpointClosure, session: session)
        return provider
    }()

    // MARK: - Initialization
    public init(environment: Environment, errorFilter: ErrorFilter, oauthSwift: OAuthSwift) {
        self.environment = environment
        self.errorFilter = errorFilter
        self.oauthSwift = oauthSwift
    }

    // MARK: - RequestAdapter
    public func adapt(_ urlRequest: URLRequest, for session: Session,
                      completion: @escaping GenericCompletion<URLRequest>) {
        var config = OAuthSwiftHTTPRequest.Config(
            urlRequest: urlRequest,
            paramsLocation: paramsLocation,
            dataEncoding: dataEncoding
        )
        config.updateRequest(credential: oauthSwift.client.credential)
        do {
            completion(.success(try OAuthSwiftHTTPRequest.makeRequest(config: config)))
        } catch {
            completion(.failure(error))
        }
    }

    // MARK: - RequestRetrier
    public func retry(_ request: Request, for session: Session,
                      dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }

    // MARK: - Dispatcher
    public func call(endpoint: TargetType, completion: @escaping Completion) {
        provider.request(MultiTarget(endpoint)) { result in
            let filtered = self.errorFilter.filterForErrors(in: result)
            self.session.setSharedCookies(for: filtered.success?.response?.url)
            completion(filtered)
        }
    }

}

public extension Alamofire.HTTPMethod {

    var oauth: OAuthSwiftHTTPRequest.Method {
        return OAuthSwiftHTTPRequest.Method(rawValue: self.rawValue)!
    }

}

public extension OAuthSwiftHTTPRequest.Method {

    var alamofire: Alamofire.HTTPMethod {
        return Alamofire.HTTPMethod(rawValue: self.rawValue)
    }

}
