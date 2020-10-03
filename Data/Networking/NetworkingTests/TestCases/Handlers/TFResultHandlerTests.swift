//
//  TFResultHandlerTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 03/10/20.
//

import XCTest
import OxeNetworking
import Moya
@testable import Domain
@testable import Networking

class TFResultHandlerTests: XCTestCase {

    private var sut: TFResultHandler!
    private let responseStub = Response(statusCode: 200, data: Data())
    private let errorStub = InteractionError.failedRequest(L10n.Error.Description.unexpected)
    private var coordinatorSpy: SignOutSceneCoordinatorSpy!

    override func setUp() {
        super.setUp()

        coordinatorSpy = SignOutSceneCoordinatorSpy()
        sut = TFResultHandler(coordinator: coordinatorSpy)
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
}
