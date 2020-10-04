//
//  UsersSearchViewModelTests.swift
//  UserTests
//
//  Created by Adriano Dias on 29/09/20.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
import RxTest
import RxSwiftUtilities
@testable import Common
@testable import Domain
@testable import User

class UsersSearchViewModelTests: XCTestCase {

    var useCaseSpy: SearchUserByNameUseCaseableSpy!
    var coordinatorSpy: UsersSearchSceneCoordinatingSpy!
    var sut: UsersSearchViewModel<UsersSearchSceneCoordinatingSpy>!
    var input: UsersSearchViewModeling.Input!

    override func setUp() {
        super.setUp()

        useCaseSpy = SearchUserByNameUseCaseableSpy()
        coordinatorSpy = UsersSearchSceneCoordinatingSpy()
        sut = UsersSearchViewModel(useCase: useCaseSpy, coordinator: coordinatorSpy)

        input = UsersSearchViewModelInput(name: .just("name"), selection: .just(0))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUsers() {
        XCTAssertEqual(try getUsers().toBlocking(timeout: 0.1).first(), useCaseSpy.users.asViewModels)
        XCTAssert(useCaseSpy.executionCalled)
    }

    func testNavigation() {
        XCTAssertNotNil(try getNavigation().toBlocking(timeout: 0.1).first())
        XCTAssert(coordinatorSpy.showTweetsForUserCalled)
    }

    private func getUsers() -> Driver<[UserViewModel]> {
        let indicator = ActivityIndicator()
        return sut.users(in: input, indicator)
    }

    private func getNavigation() -> Driver<Void> {
        let users = getUsers()
        users.drive().disposed(by: bag)
        return sut.navigation(in: input, withLatestFrom: users)
    }
}
