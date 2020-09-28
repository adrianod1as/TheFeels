//
//  NumberExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
@testable import Domain

class NumberExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCollectionInt8() {
        let ints: [Int] = [9, 2, 4, 7, 8]
        XCTAssertEqual(ints.string, "92478")
    }
}

