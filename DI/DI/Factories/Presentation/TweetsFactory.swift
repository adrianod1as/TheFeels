//
//  TweetsFactory.swift
//  DI
//
//  Created by Adriano Dias on 03/10/20.
//

import Tweet
import Swinject
import Common
import Domain

class TweetsFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension TweetsFactory: TweetsManufacturing {

    func makeUserTweetsViewController(user: User?) -> UserTweetsViewController {
        let viewModel = resolver.safelyResolve(UserTweetsViewModeling.self)
        (viewModel as? UserTweetsViewModel<TweetsCoordinator>)?.user = user
        return UserTweetsViewController(viewModel: viewModel)
    }
}
