//
//  AnalysisTargetTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 04/10/20.
//

import XCTest
import Moya
@testable import Networking

class SentimentTargetTests: XCTestCase {

    private var sut: SentimentTarget!
    private let textStub = "Some random thing"

    override func setUp() {
        super.setUp()

        sut = .analyze(text: textStub)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBaseUrl() {
        XCTAssertEqual(sut.baseURL, URL(string: "https://sentim-api.herokuapp.com")!)
    }

    func testApi() {
        XCTAssertEqual(sut.api, "api")
    }

    func testVersion() {
        XCTAssertEqual(sut.version, "v1")
    }

    func testPath() {
        XCTAssertEqual(sut.path, "\(sut.api)/\(sut.version)")
    }

    func testSpecificHeaderTypes() {
        XCTAssertEqual(sut.specificHeaderTypes.map({ $0.key }), [SpecificHeaderType.sentimKey.key])
    }

    func testKeyPathForData() {
        XCTAssertEqual(sut.keyPathForData, "result")
    }

    func testValidationType() {
        XCTAssertEqual(sut.validationType, .successAndRedirectCodes)
    }

    func testHeaders() {
        XCTAssertNil(sut.headers)
    }

    func testMethod() {
        XCTAssertEqual(sut.method, .post)
    }

    func testSampleData() {
        XCTAssertEqual(sut.sampleData, Data())
    }

    func testTask() {
        let task = Task.requestParameters(parameters: ["text": textStub], encoding: JSONEncoding.default)
        switch (sut.task, task) {
        case (.requestParameters(let parametersA, let encodingA),
              .requestParameters(let parametersB, let encodingB)):
            XCTAssertEqual(parametersA as? [String: String], parametersB as? [String: String])
            XCTAssertNotNil(encodingA as? JSONEncoding)
            XCTAssertNotNil(encodingB as? JSONEncoding)
        default:
            XCTFail("Different tasks")
        }
    }
}
