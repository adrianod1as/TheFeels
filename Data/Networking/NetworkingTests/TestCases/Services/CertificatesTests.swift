//
//  CertificatesTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
@testable import Networking

class CertificatesTests: XCTestCase {

    private var sut: Certificates!

    override func setUp() {
        super.setUp()

        sut = Certificates.none
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFiles() {
        XCTAssert(sut.files.isEmpty)
    }

    func testEvaluatorKey() {
        XCTAssert(sut.evaluatorKey.isEmpty)
    }
}
