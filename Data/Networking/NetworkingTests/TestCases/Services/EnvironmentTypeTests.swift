//
//  EnvironmentTypeTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Networking

class EnvironmentTypeTests: XCTestCase {

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testName() {
        XCTAssertEqual(EnvironmentType.allCases.map({ $0.name }),
                       EnvironmentType.allCases.map({ $0.rawValue }))
    }

    func testBaseUrl() {
        XCTAssertEqual(EnvironmentType.allCases.map({ $0.baseURL }), EnvironmentType.allCases.map({ _ in nil }))
    }

    func testMayBeSimulated() {
        XCTAssertEqual(EnvironmentType.allCases.map({ $0.mayBeSimulated }),
                       EnvironmentType.allCases.map({ $0 != .store }))
    }
}
