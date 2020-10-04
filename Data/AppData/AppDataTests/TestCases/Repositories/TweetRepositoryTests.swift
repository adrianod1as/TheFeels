//
//  TweetRepositoryTests.swift
//  AppDataTests
//
//  Created by Adriano Dias on 03/10/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import AppData

class TweetRepositoryTests: XCTestCase {

    private var sut: TweetRepository!
    private var spy: TweetRemoteDataSourceSpy!

    override func setUp() {
        super.setUp()

        spy = TweetRemoteDataSourceSpy()
        sut = TweetRepository(remoteDataSource: spy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTweetSearch() {
        XCTAssertEqual(try sut.searchTweets(by: "SwiftLang").toBlocking(timeout: 0.1).first(), spy.tweets)
        XCTAssert(spy.searchTweetsCalled)
    }

    func testAnalyzeTweet() {
        XCTAssertEqual(spy.sentimentAnalysis,
                       try sut.analyzeTweet(text: "Some random thing").toBlocking(timeout: 0.1).first())
        XCTAssert(spy.analyzeTweetForTextCalled)
    }
}
