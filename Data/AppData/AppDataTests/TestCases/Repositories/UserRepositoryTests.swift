//
//  UserRepositoryTests.swift
//  AppDataTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import AppData

class UserRepositoryTests: XCTestCase {

    private var sut: UserRepository!
    private var spy: UserRemoteDataSourceSpy!

    override func setUp() {
        super.setUp()

        spy = UserRemoteDataSourceSpy()
        sut = UserRepository(remoteDataSource: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testUserSearch() {
        XCTAssertEqual(try sut.searchUser(by: "SwiftLang").toBlocking(timeout: 0.1).first(), spy.users)
        XCTAssert(spy.searchUserCalled)
    }
}
