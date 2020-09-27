//
//  CoordinatorFactoryAssembly.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Common
import AppNavigation

class CoordinatorFactoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(CoordinatorManufacturing.self) { resolver in
            return CoordinatorFactory(resolver: resolver)
        }
    }
}
