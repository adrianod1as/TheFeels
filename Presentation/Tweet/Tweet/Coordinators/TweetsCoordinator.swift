//
//  TweetsCoordinator.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import Common

public protocol TweetsDepartingCoordinating: AnyObject {

}

public class TweetsCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: TweetsManufacturing

    private let departingCoordinator: TweetsDepartingCoordinating

    public init(navigationController: UINavigationController,
                departingCoordinator: TweetsDepartingCoordinating,
                factory: TweetsManufacturing) {
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
        self.factory = factory
    }

    public func start() {}

    public func showTweets(for user: UserViewModel) {
        let viewController = factory.makeUserTweetsViewController(user: user.user)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension TweetsCoordinator: ReactiveCompatible {}

extension TweetsCoordinator: UserTweetsSceneCoordinating {

    public func showSentiment(for user: TweetViewModel) {

    }
}
