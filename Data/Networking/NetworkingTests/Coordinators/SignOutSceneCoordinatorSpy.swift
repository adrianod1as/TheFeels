//
//  SignOutSceneCoordinatorSpy.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

@testable import Domain

class SignOutSceneCoordinatorSpy: SignOutSceneCoordinating {

    var didSignOutCalled = false

    func didSignOut() {
        didSignOutCalled.toggle()
    }
}
