//
//  UserFlowAssembly.swift
//  DI
//
//  Created by Adriano Dias on 29/09/20.
//

import User
import Swinject
import SwinjectAutoregistration

class UsersFlowAssembly: Assembly {

    func assemble(container: Container) {
        container.register(UsersManufacturing.self) { resolver in
            return UsersFactory(resolver: resolver)
        }
        container.autoregister(UsersViewModeling.self, initializer: UsersViewModel<UsersCoordinator>.init)
    }
}
