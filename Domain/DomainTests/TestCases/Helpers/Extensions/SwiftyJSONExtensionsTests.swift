//
//  SwiftyJSONExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 12/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import Domain

class SwiftyJSONExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testConvertingStringData() {
        let string = "string"
        let stringData = string.data(using: .utf8)!
        let correctJson = JSON.nonNullableJson(stringData: stringData)
        XCTAssertEqual(string, correctJson?.stringValue)
        let wrongJson = JSON.nonNullableJson(stringData)
        XCTAssertNotEqual(string, wrongJson?.stringValue)
        let otherCorrectJSON = JSON.nonNullableJson(data: stringData)
        XCTAssertEqual(string, otherCorrectJSON?.stringValue)
    }

    func testDecoding() {
        let sut = User.getFakedItem()
        let json = sut.json
        let expected = json.decode(User.self)
        XCTAssertEqual(sut.id, expected?.id)
    }

    func testDataObject() {
        XCTAssertNotNil(JSON("something").dataObject)
        XCTAssertNotNil(JSON(["key": "value"]).dataObject)
        XCTAssertNotNil(User.getFakedItem().json.dataObject)
    }
}
