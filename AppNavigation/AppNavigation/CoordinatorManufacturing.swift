//
//  CoordinatorManufacturing.swift
//  AppNavigation
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import User
import Tweet

public protocol CoordinatorManufacturing {

    func makeUsersCoordinator() -> UsersCoordinator
    func makeTweetsCoordinator() -> TweetsCoordinator
}
