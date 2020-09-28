//
//  SearchUserByNameUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import Domain

class SearchUserByNameUseCaseTests: XCTestCase {

    private var sut: SearchUserByNameUseCase!
    private var spy: UserRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = UserRepositorySpy()
        sut = SearchUserByNameUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExcutionSuccess() {
        let result = try! sut.execute("SwiftLang").toBlocking(timeout: 0.1).first()
        XCTAssertNotNil(result)
        XCTAssert(spy.searchUserCalled)
    }

    func testExcutionFailure() {
        XCTAssertThrowsError(try sut.execute(String()).toBlocking(timeout: 0.1).first())
        XCTAssertFalse(spy.searchUserCalled)
    }
}
