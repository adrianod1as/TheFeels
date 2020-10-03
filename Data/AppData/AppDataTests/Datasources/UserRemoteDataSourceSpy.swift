//
//  UserRemoteDataSourceSpy.swift
//  AppDataTests
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift
import Domain
@testable import AppData

class UserRemoteDataSourceSpy: UserRemoteDataSource {

    let users = User.getFakedArray(amount: 4)
    var searchUserCalled = false

    func searchUser(by name: String) -> Observable<[User]> {
        searchUserCalled.toggle()
        return .just(users)
    }
}
