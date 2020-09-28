//
//  UserRepositorySpy.swift
//  DomainTests
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift
@testable import Domain

class UserRepositorySpy: UserRepository {

    var searchUserCalled = false

    func searchUser(by name: String) -> Observable<[User]> {
        searchUserCalled.toggle()
        return .just(User.getFakedArray(amount: 4))
    }
}
