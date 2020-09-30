//
//  UsersManufacturing.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

@testable import User

class UsersManufacturingSpy: UsersManufacturing {

    var makeUsersViewControllerCalled = false

    func makeUsersViewController() -> UsersViewController {
        makeUsersViewControllerCalled.toggle()
        return UsersViewController(viewModel: UsersViewModel(useCase: SearchUserByNameUseCaseableSpy(),
                                                             coordinator: UsersSceneCoordinatingSpy()))
    }

}
