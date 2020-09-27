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

class CoordinatorsAssembly: Assembly {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
    }

    internal func assembleAppCoordinator(container: Container) {
        container.register(AppCoordinator.self) { resolver in
            return AppCoordinator(navigationController: self.navigationController,
                                  factory: resolver.safelyResolve(CoordinatorManufacturing.self))
        }
    }
}
