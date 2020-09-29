//
//  UserViewModel.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import Domain

public struct UserViewModel {

    let user: User
}

extension User {

    var asViewModel: UserViewModel {
        UserViewModel(user: self)
    }
}

extension Array where Element == User {

    var asViewModels: [UserViewModel] {
        map({ $0.asViewModel })
    }
}
