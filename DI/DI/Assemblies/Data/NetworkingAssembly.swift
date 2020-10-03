//
//  NetworkingAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Networking
import OxeNetworking
import Alamofire
import AppData
import OAuthSwift

class NetworkingAssembly: Assembly {

    private let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }

    func assemble(container: Container) {
        assembleServices(for: container)
        assembleDatasources(for: container)
    }

    func assembleServices(for container: Container) {
        container.register(Environment.self) { _ in self.environment }
        container.autoregister(ErrorFilter.self, initializer: TFErrorFilter.init)
        container.register(OAuthSwift.self) { resolver in
            guard let oauth = resolver.safelyResolve(Environment.self).oauth1Swift else {
                preconditionFailure()
            }
            return oauth
        }
        container.register(OAuthHandling.self) { resolver in
            OAuthHandler(oauthSwift: resolver.safelyResolve(OAuthSwift.self))
        }
        container.autoregister(RequestInterceptor.self, initializer: UserSessionRequestHandler.init)
        container.register(ResultHandler.self) { _ in
            TFResultHandler(coordinator: nil)
        }
        container.autoregister(CommonMoyaDispatcher.self, initializer: CommonMoyaDispatcher.init).implements(Dispatcher.self)
    }

    func assembleDatasources(for containter: Container) {
        containter.autoregister(AppData.UserRemoteDataSource.self,
                                initializer: Networking.UserRemoteDataSource<CommonMoyaDispatcher>.init)
    }
}
