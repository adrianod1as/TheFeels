//
//  UserTargetTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 28/09/20.
//

import XCTest
import Moya
@testable import Networking

class UsersTargetTests: XCTestCase {

    private var sut: UsersTarget!
    private let usernameStub = "SwiftLang"

    override func setUp() {
        super.setUp()

        sut = .search(username: usernameStub)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBaseUrl() {
        XCTAssertEqual(sut.baseURL, URL(string: "https://api.twitter.com/")!)
    }

    func testApi() {
        XCTAssertEqual(sut.api, "users")
    }

    func testVersion() {
        XCTAssertEqual(sut.version, 1.1.description)
    }

    func testPath() {
        XCTAssertEqual(sut.path, "\(sut.version)/\(sut.api)/search.json")
    }

    func testSpecificHeaderTypes() {
        XCTAssert(sut.specificHeaderTypes.isEmpty)
    }

    func testKeyPathForData() {
        XCTAssertNil(sut.keyPathForData)
    }

    func testValidationType() {
        XCTAssertEqual(sut.validationType, .successAndRedirectCodes)
    }

    func testHeaders() {
        XCTAssertNil(sut.headers)
    }

    func testMethod() {
        XCTAssertEqual(sut.method, .get)
    }

    func testSampleData() {
        XCTAssertEqual(sut.sampleData, Data())
    }

    func testTask() {
        let task = Task.requestParameters(parameters: ["q": usernameStub], encoding: URLEncoding.default)
        switch (sut.task, task) {
        case (.requestParameters(let parametersA, let encodingA),
              .requestParameters(let parametersB, let encodingB)):
            XCTAssertEqual(parametersA as? [String: String], parametersB as? [String: String])
            XCTAssertNotNil(encodingA as? URLEncoding)
            XCTAssertNotNil(encodingB as? URLEncoding)
        default:
            XCTFail("Different tasks")
        }
    }
}
