//
//  UsersCoordinator.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import Common

public protocol UsersDepartingCoordinating: AnyObject {

    func showTweets(for user: UserViewModel)
}

public class UsersCoordinator: Coordinator {

    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []

    public var navigationController: UINavigationController

    private let factory: UsersManufacturing

    private let departingCoordinator: UsersDepartingCoordinating

    public init(navigationController: UINavigationController,
                departingCoordinator: UsersDepartingCoordinating,
                factory: UsersManufacturing) {
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
        self.factory = factory
    }

    public func start() {
        showUsers()
    }

    internal func showUsers() {
        let viewController = factory.makeUsersViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension UsersCoordinator: ReactiveCompatible {}

extension UsersCoordinator: UsersSceneCoordinating {

    public func showTweets(for user: UserViewModel) {
        departingCoordinator.showTweets(for: user)
    }
}
