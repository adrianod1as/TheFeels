//
//  TFErrorFilterTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 03/10/20.
//

import XCTest
import OxeNetworking
import Moya
@testable import Domain
@testable import Networking

class TFErrorFilterTests: XCTestCase {

    private var sut: TFErrorFilter!
    private let responseStub = Response(statusCode: 200, data: Data())
    private let errorStub = InteractionError.failedRequest(L10n.Error.Description.unexpected)

    override func setUp() {
        super.setUp()

        sut = TFErrorFilter()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFilterError() {
        XCTAssertEqual(sut.filter(error: InteractionError.failedRequest(L10n.Error.Description.unexpected)).localizedDescription,
                       errorStub.localizedDescription)
    }

    func testGetDafaultError() {
        XCTAssertEqual(sut.getDefaultError().localizedDescription, errorStub.localizedDescription)
    }

    func testFilterForErrorsInResult() {
        let result: MoyaResult = .failure(MoyaError.underlying(errorStub, nil))
        XCTAssertEqual(sut.filterForErrors(in: result.result).failure?.localizedDescription,
                       result.failure?.localizedDescription)
    }

    func testFilterForErrorsInResponse() {
        do {
            let response = try sut.filterForErrors(in: responseStub.moyaResponse)
            XCTAssertEqual(response, responseStub)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
