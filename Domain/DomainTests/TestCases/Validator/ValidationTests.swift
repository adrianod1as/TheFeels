//
//  ValidationTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 11/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class ValidationTests: XCTestCase {

    private var sut: Validation<String>!

    override func setUp() {
        super.setUp()

        sut = .nonEmpty()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSuccess() {
        XCTAssert(sut.isValid(value: L10n.Error.Title.ops).isValid)
    }

    func testFailure() {
        XCTAssertFalse(sut.isValid(value: String()).isValid)
    }
}
