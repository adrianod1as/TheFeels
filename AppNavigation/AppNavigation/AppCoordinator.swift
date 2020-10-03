//
//  AppCoordinator.swift
//  AppNavigation
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Common
import User
import Tweet

public class AppCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: CoordinatorManufacturing

    public init(navigationController: UINavigationController, factory: CoordinatorManufacturing) {
        self.navigationController = navigationController
        self.factory = factory
    }

    public func start() {
        showUsersSearch()
    }

    internal func showUsersSearch() {
        factory.makeUsersCoordinator().start()
    }
}

extension AppCoordinator: UsersDepartingCoordinating {

    public func showTweets(for user: UserViewModel) {

    }
}

extension AppCoordinator: TweetsDepartingCoordinating {}
