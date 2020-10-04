//
//  SearchUserByNameUseCaseableSpy.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
@testable import Domain

class SearchUserByNameUseCaseableSpy: SearchUserByNameUseCaseable {

    let users = User.getFakedArray(amount: 4)

    var executionCalled = false

    func execute(_ name: String) -> Observable<[User]> {
        executionCalled.toggle()
        return .just(users)
    }
}
