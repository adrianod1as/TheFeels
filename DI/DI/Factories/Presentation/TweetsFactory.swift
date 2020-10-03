//
//  TweetsFactory.swift
//  DI
//
//  Created by Adriano Dias on 03/10/20.
//

import Tweet
import Swinject
import Common

class TweetsFactory {

    private let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension TweetsFactory: TweetsManufacturing {

    func makeUserTweetsViewController() -> UserTweetsViewController {
        UserTweetsViewController(viewModel: resolver.safelyResolve(UserTweetsViewModeling.self))
    }
}
