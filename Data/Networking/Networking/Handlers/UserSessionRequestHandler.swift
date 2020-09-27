//
//  UserSessionRequestHandler.swift
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import SwiftyJSON
import Domain
import AppData
import OxeNetworking

public class UserSessionRequestHandler: RequestHandler {

    public var environment: Environment
    internal weak var coordinator: SignOutSceneCoordinating?
    private let lock = NSLock()
    private var isRefreshing = false
    private var requestsToRetry: [(RetryResult) -> Void] = []
    private var retryCount: Int = 0

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
    public init(environment: Environment, coordinator: SignOutSceneCoordinating?) {
        self.environment = environment
        self.coordinator = coordinator
    }

    // MARK: - RequestHandler
    public func handleRequest(response: Response?, completion: @escaping GenericCompletion<Void>) {
        completion(.success(()))
    }

    public func handleRequest(error: Error?, completion: @escaping GenericCompletion<Void>) {
        guard let interactionError = error as? InteractionError else {
            completion(.success(()))
            return
        }
        switch interactionError {
        case .expiredUserSession:
            handleExpiredUserSession()
            completion(.success(()))
        default:
            completion(.success(()))
        }
    }

    private func handleExpiredUserSession() {
        coordinator?.didSignOut()
    }

    // MARK: - RequestAdapter
    public func adapt(_ urlRequest: URLRequest, for session: Session,
                      completion: @escaping GenericCompletion<URLRequest>) {
        completion(.success(urlRequest))
    }

    // MARK: - RequestRetrier
    public func retry(_ request: Request, for session: Session,
                      dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }

    // MARK: - ErrorFilter
    public func getDefaultError() -> Error {
        InteractionError.failedRequest(L10n.Error.Description.unexpected)
    }

    public func filter(error: Error) -> Error {
        error
    }

    public func filterForErrors(in result: MoyaDispatcherResult) -> MoyaResult {
        result.result
    }

    public func filterForErrors(in response: MoyaDispatcherResponse) throws -> Response {
        response.moyaResponse
    }

    // MARK: - Dispatcher
    public func call(endpoint: TargetType, completion: @escaping Completion) {
        provider.request(MultiTarget(endpoint)) { result in
            let filtered = self.filterForErrors(in: result)
            self.session.setSharedCookies(for: filtered.success?.response?.url)
            completion(filtered)
        }
    }

}
