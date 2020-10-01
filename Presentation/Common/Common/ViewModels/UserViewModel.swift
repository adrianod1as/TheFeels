//
//  UserViewModel.swift
//  Common
//
//  Created by Adriano Dias on 29/09/20.
//

import Domain

public struct UserViewModel {

    let user: User

    public var name: String {
        user.name
    }

    public var username: String {
        "@\(user.screenName)"
    }

    public var profileImageUrl: URL? {
        URL(string: user.profileImageUrl)
    }
}

public extension User {

    var asViewModel: UserViewModel {
        UserViewModel(user: self)
    }
}

public extension Array where Element == User {

    var asViewModels: [UserViewModel] {
        map({ $0.asViewModel })
    }
}
