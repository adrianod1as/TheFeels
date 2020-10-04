//
//  DependencyInjector.swift
//  DI
//
//  Created by Adriano Dias on 19/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import OxeNetworking
import AppNavigation

public class DependencyInjector {

    private let environment: Environment
    private let group: String
    private let identifier: String

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.asTheFeels()
        return navigationController
    }()

    private lazy var assembler: Assembler = {
        Assembler([
            CoordinatorFactoryAssembly(),
            CoordinatorsAssembly(navigationController: navigationController),
            UsersFlowAssembly(),
            TweetsFlowAssembly(),
            DomainAssembly(),
            DataAssembly(),
            NetworkingAssembly(environment: environment),
            StorageAssembly(service: identifier, accessGroup: group)
        ])
    }()

    public init(environment: Environment, group: String, identifier: String) {
        self.environment = environment
        self.group = group
        self.identifier = identifier
    }

    public func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> Void) {
        let appCoordinator = assembler.resolver.safelyResolve(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }

}
