//
//  CoordinatorsAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Common
import AppNavigation
import User
import Tweet

class CoordinatorsAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
        assembleUsersCoordinator(container: container)
        assembleTweetsCoordinator(container: container)
    }

    internal func assembleAppCoordinator(container: Container) {
        container.register(AppCoordinator.self) { resolver in
            return AppCoordinator(navigationController: self.navigationController,
                                  factory: resolver.safelyResolve(CoordinatorManufacturing.self))
        }.implements(UsersDepartingCoordinating.self, TweetsDepartingCoordinating.self)
    }

    internal func assembleUsersCoordinator(container: Container) {
        container.register(UsersCoordinator.self) { resolver in
            return UsersCoordinator(navigationController: self.navigationController,
                                   departingCoordinator: resolver.safelyResolve(UsersDepartingCoordinating.self),
                                   factory: resolver.safelyResolve(UsersManufacturing.self))
        }
    }

    internal func assembleTweetsCoordinator(container: Container) {
        container.register(TweetsCoordinator.self) { resolver in
            return TweetsCoordinator(navigationController: self.navigationController,
                                     departingCoordinator: resolver.safelyResolve(TweetsDepartingCoordinating.self),
                                     factory: resolver.safelyResolve(TweetsManufacturing.self))
        }
    }

}
