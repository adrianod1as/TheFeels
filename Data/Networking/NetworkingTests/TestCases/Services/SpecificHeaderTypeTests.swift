//
//  SpecificHeaderTypeTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Networking

class SpecificHeaderTypeTests: XCTestCase {

    private var sut: SpecificHeaderType!

    override func setUp() {
        super.setUp()

        sut = .token
    }

    override func tearDown() {
        super.tearDown()
    }

    func testKey() {
        XCTAssertEqual(sut.key, sut.rawValue)
    }
}
