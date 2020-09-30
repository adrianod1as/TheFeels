//
//  UsersSceneCoordinatingSpy.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
@testable import Common
@testable import User

class UsersSceneCoordinatingSpy: ReactiveCompatible, UsersSceneCoordinating {

    var showTweetsForUserCalled = false

    func showTweets(for user: UserViewModel) {
        showTweetsForUserCalled.toggle()
    }
}
