//
//  SearchTweetsByTweetnameUseCaseTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 03/10/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import Domain

class SearchTweetsByUsernameUseCaseTests: XCTestCase {

    private var sut: SearchTweetsByUsernameUseCase!
    private var spy: TweetRepositorySpy!

    override func setUp() {
        super.setUp()

        spy = TweetRepositorySpy()
        sut = SearchTweetsByUsernameUseCase(repository: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExcutionSuccess() {
        XCTAssertEqual(try sut.execute("Swift.Lang").toBlocking(timeout: 0.1).first(), spy.tweets)
        XCTAssert(spy.searchTweetsCalled)
    }

    func testExcutionEmptyFailure() {
        XCTAssertThrowsError(try sut.execute(String()).toBlocking(timeout: 0.1).first())
        XCTAssertFalse(spy.searchTweetsCalled)
    }

    func testExcutionMultipleWordsFailure() {
        XCTAssertThrowsError(try sut.execute("Swift.Lang Official").toBlocking(timeout: 0.1).first())
        XCTAssertFalse(spy.searchTweetsCalled)
    }
}
