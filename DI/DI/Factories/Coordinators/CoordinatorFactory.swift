//
//  CoordinatorFactory.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Common
import AppNavigation
import User

public class CoordinatorFactory: DependencyManufacturing {

    private let resolver: Resolver

    public required init(resolver: Resolver) {
        self.resolver = resolver
    }

}

extension CoordinatorFactory: CoordinatorManufacturing {

    public func makeUsersCoordinator() -> UsersCoordinator {
        resolver.safelyResolve(UsersCoordinator.self)
    }
}
