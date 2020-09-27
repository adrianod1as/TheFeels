//
//  UserSessionRequestHandlerTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 13/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import XCTest
import Alamofire
import OxeNetworking
import Moya
@testable import Domain
@testable import Networking

class UserSessionRequestHandlerTests: XCTestCase {

    private var sut: UserSessionRequestHandler!
    private let responseStub = Response(statusCode: 200, data: Data())
    private let errorStub = InteractionError.failedRequest(L10n.Error.Description.unexpected)
    private let environmentStub = Environment(type: EnvironmentType.development, fixturesType: FixturesType.none)
    private lazy var sessionStub: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    private var spy: SignOutSceneCoordinating!

    override func setUp() {
        super.setUp()

        spy = SignOutSceneCoordinatorSpy()
        sut = UserSessionRequestHandler(environment: environmentStub, coordinator: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHandleRequestResponse() {
        sut.handleRequest(response: responseStub) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testHandleRequestNonInteractionError() {
        sut.handleRequest(error: NSError()) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testHandleRequestNonMappedInteractionError() {
        sut.handleRequest(error: InteractionError.failedRequest(String())) { result in
            XCTAssertNotNil(result.success)
        }
    }

    func testHandleRequestExpiredUserSession() {
        sut.handleRequest(error: InteractionError.expiredUserSession(String())) { result in
            guard let coordinator = self.sut.coordinator as? SignOutSceneCoordinatorSpy else {
                XCTFail("Should be possible to cast coordinator as SignOutSceneCoordinatorSpy")
                return
            }
            XCTAssert(coordinator.didSignOutCalled)
            XCTAssertNotNil(result.success)
        }
    }

    func testAdaptURLReques() {
        let urlRequest = URLRequest(url: URL(string: "https://apple.com")!)
        sut.adapt(urlRequest, for: sessionStub) { result in
            XCTAssertEqual(result.success, urlRequest)
        }
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
