//
//  AnalyzeSentimentForTextUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 04/10/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import Domain

class AnalyzeSentimentForTextUseCaseTests: XCTestCase {

    private var sut: AnalyzeSentimentForTextUseCase!
    private var spy: TweetRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = TweetRepositorySpy()
        sut = AnalyzeSentimentForTextUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExcutionSuccess() {
        XCTAssertEqual(try sut.execute("Some random thing").toBlocking(timeout: 0.1).first(), spy.sentimentAnalysis)
        XCTAssert(spy.analyzeTweetForTextCalled)
    }

    func testExcutionEmptyFailure() {
        XCTAssertThrowsError(try sut.execute(String()).toBlocking(timeout: 0.1).first())
        XCTAssertFalse(spy.analyzeTweetForTextCalled)
    }
}

