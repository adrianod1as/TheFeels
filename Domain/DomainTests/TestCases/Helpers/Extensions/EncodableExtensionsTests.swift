//
//  EncodableExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
@testable import Domain

class EncodableExtensionsTests: XCTestCase {

    private var sut: User!

    override func setUp() {
        super.setUp()

        sut = User.getFakedItem()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testData() {
        XCTAssertNotNil(sut.data)
    }

    func testJSON() {
        XCTAssertNotNil(sut.json)
    }

    func testRawObject() {
        XCTAssertNotNil(sut.rawObject)
    }

}
