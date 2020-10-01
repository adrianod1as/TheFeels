//
//  UserFactory.swift
//  DI
//
//  Created by Adriano Dias on 29/09/20.
//

import User
import Swinject
import Common

class UsersFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension UsersFactory: UsersManufacturing {

    public func makeUsersSearchViewController() -> UsersSearchViewController {
        UsersSearchViewController(viewModel: resolver.safelyResolve(UsersSearchViewModeling.self))
    }
}
