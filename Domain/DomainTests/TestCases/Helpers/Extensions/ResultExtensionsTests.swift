//
//  ResultExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 11/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class ResultExtensionsTests: XCTestCase {

    private var sut: Result<String, Error>!

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccess() {
        let stub = L10n.Symbol.locale
        sut = .success(stub)
        XCTAssertEqual(sut.success, stub)
        XCTAssertNil(sut.failure)
    }

    func testFailure() {
        let stub = InteractionError.failedRequest("message")
        sut = .failure(stub)
        XCTAssertEqual(sut.failure?.localizedDescription, stub.localizedDescription)
        XCTAssertNil(sut.success)
    }
}
