//
//  InteractionErrorTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
@testable import Domain

class InteractionErrorTests: XCTestCase {

    private var sut: InteractionError!
    private let stubError: (failureReason: String, errorDescription: String) = (L10n.Error.Title.ops, "message")

    override func setUp() {
        super.setUp()

        sut = .invalidInput(stubError.errorDescription)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFailureReason() {
        XCTAssertEqual(sut.failureReason, stubError.failureReason)
    }

    func testErrorDescription() {
        XCTAssertEqual(sut.errorDescription, stubError.errorDescription)
        sut = InteractionError.none
        XCTAssertEqual(sut.errorDescription, String())
    }

}

