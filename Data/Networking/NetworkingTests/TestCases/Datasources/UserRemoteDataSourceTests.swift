//
//  UserRemoteDataSourceTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import Domain
@testable import Networking

class UserRemoteDataSourceTests: XCTestCase {

    private var sut: UserRemoteDataSource<DispacherFake>!
    private let stub = User.getFakedArray(amount: 4)
    private var dispatcherFake: DispacherFake!

    override func setUp() {
        super.setUp()

        dispatcherFake = DispacherFake(model: stub)
        sut = UserRemoteDataSource(dispatcher: dispatcherFake)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchUser() {
        XCTAssertEqual(try sut.searchUser(by: "SwiftLang").toBlocking(timeout: 0.1).first(), stub)
    }

}
