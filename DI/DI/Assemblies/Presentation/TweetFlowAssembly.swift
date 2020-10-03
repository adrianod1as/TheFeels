//
//  TweetFlowAssembly.swift
//  DI
//
//  Created by Adriano Dias on 03/10/20.
//

import Tweet
import Swinject
import SwinjectAutoregistration

class TweetsFlowAssembly: Assembly {

    func assemble(container: Container) {
        container.register(TweetsManufacturing.self) { resolver in
            return TweetsFactory(resolver: resolver)
        }
        container.autoregister(UserTweetsViewModeling.self, initializer: UserTweetsViewModel<TweetsCoordinator>.init)
    }
}
