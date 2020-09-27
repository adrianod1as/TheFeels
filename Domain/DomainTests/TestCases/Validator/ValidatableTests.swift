//
//  ValidatableTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Domain

class ValidatableTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()

    }

    func testValidable() {
        let sucess: ValidationResult = .success(())
        let successful = ModelStub(validations: [sucess])
        let failure = ModelStub(validations: [.failure(ModelStub.Failure.some(String())), sucess])
        XCTAssertTrue(successful.isValid)
        XCTAssertFalse(failure.isValid)
    }

    func testValidationResultIsValid() {
        let sucess: ValidationResult = .success(())
        let failure: ValidationResult = .failure(InteractionError.invalidInput(String()))
        XCTAssertTrue(sucess.isValid)
        XCTAssertFalse(failure.isValid)
    }

    func testValidationError() {
        let failureReason = L10n.Error.Title.ops
        let errorDescription = L10n.Error.Message.requiment
        let error = ErrorStub(failureReason: failureReason, errorDescription: errorDescription)
        XCTAssertEqual(error.localizedDescription, errorDescription)
        XCTAssertEqual(error.failureReason, failureReason)
    }

}
