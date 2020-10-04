//
//  UsersManufactoring.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import Domain

public protocol TweetsManufacturing {

    func makeUserTweetsViewController(user: User?) -> UserTweetsViewController
}
