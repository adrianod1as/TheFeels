//
//  UsersManufacturing.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

@testable import User

class UsersManufacturingSpy: UsersManufacturing {

    var makeUsersSearchViewControllerCalled = false

    func makeUsersSearchViewController() -> UsersSearchViewController {
        makeUsersSearchViewControllerCalled.toggle()
        return UsersSearchViewController(viewModel: UsersSearchViewModel(useCase: SearchUserByNameUseCaseableSpy(),
                                                             coordinator: UsersSearchSceneCoordinatingSpy()))
    }

}
