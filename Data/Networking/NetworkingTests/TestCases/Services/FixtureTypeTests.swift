//
//  FixtureTypeTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Networking

class FixtureTypeTests: XCTestCase {

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testIsEnabled() {
        XCTAssertEqual(FixturesType.allCases.map({ $0.isEnabled }), FixturesType.allCases.map({ $0 != .none }))
    }

    func testIsJsonType() {
        XCTAssertEqual(FixturesType.allCases.map({ $0.isJsonType }), FixturesType.allCases.map({ $0 == .json }))
    }
}
