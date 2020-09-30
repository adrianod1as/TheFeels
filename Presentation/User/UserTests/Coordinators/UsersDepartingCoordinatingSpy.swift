//
//  UsersDepartingCoordinatingSpy.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

@testable import Common
@testable import User

class UsersDepartingCoordinatingSpy: UsersDepartingCoordinating {

    var showTweetsForUserCalled = false

    func showTweets(for user: UserViewModel) {
        showTweetsForUserCalled.toggle()
    }
}

