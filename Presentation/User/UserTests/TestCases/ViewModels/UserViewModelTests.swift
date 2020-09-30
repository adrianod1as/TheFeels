//
//  UserViewModelTests.swift
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

class UsersPresenterTests: XCTestCase {

    var bag: DisposeBag!
    var useCaseSpy: SearchUserByNameUseCaseableSpy!
    var coordinatorSpy: UsersSceneCoordinatingSpy!
    var sut: UsersViewModel<UsersSceneCoordinatingSpy>!
    var input: UsersViewModeling.Input!

    override func setUp() {
        super.setUp()

        bag = DisposeBag()
        useCaseSpy = SearchUserByNameUseCaseableSpy()
        coordinatorSpy = UsersSceneCoordinatingSpy()
        sut = UsersViewModel(useCase: useCaseSpy, coordinator: coordinatorSpy)

        input = UsersViewModelInput(name: .just("name"), selection: .just(0))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUsers() {
        XCTAssertNotNil(try getUsers().toBlocking(timeout: 0.1).first())
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
