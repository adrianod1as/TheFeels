//
//  UserCoordiantorTests.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

import XCTest
@testable import User
@testable import Domain

class UserCoordiantorTests: XCTestCase {

    var useCaseSpy: SearchUserByNameUseCaseableSpy!
    var departingCoordinatorSpy: UsersDepartingCoordinatingSpy!
    var sut: UsersCoordinator!
    var factorySpy: UsersManufacturingSpy!

    override func setUp() {
        super.setUp()

        factorySpy = UsersManufacturingSpy()
        departingCoordinatorSpy = UsersDepartingCoordinatingSpy()
        sut = UsersCoordinator(navigationController: UINavigationController(),
                               departingCoordinator: departingCoordinatorSpy, factory: factorySpy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShowUsers() {
        sut.start()
        XCTAssert(factorySpy.makeUsersViewControllerCalled)
    }

    func testShowTweetsForUsers() {
        sut.showTweets(for: User.getFakedItem().asViewModel)
        XCTAssert(departingCoordinatorSpy.showTweetsForUserCalled)
    }
}
