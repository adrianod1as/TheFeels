//
//  AppDelegate.swift
//  TheFeels
//
//  Created by Adriano Dias on 26/09/20.
//

import UIKit
import Swinject
import DI
import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembler: Assembler?

    private lazy var dependencyInjector: DependencyInjector = {
        return DependencyInjector(environment: SetupConstants.environment,
                                  group: SetupConstants.group, identifier: SetupConstants.identifier)
    }()

    private func setupWindow(navigationController: UINavigationController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupLogger()
        dependencyInjector.build { assembler, appCoordinator in
            self.assembler = assembler
            setupWindow(navigationController: appCoordinator.navigationController)
            appCoordinator.start()
        }
        return true
    }

    private func setupLogger() {
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
    }
}
