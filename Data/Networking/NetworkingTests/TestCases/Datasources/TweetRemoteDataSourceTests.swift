//
//  TweetRemoteDataSourceTests.swift
//  NetworkingTests
//
//  Created by Adriano Dias on 03/10/20.
//

import XCTest
import RxSwift
import RxBlocking
@testable import Domain
@testable import Networking

class TweetRemoteDataSourceTests: XCTestCase {

    private var sut: TweetRemoteDataSource<DispacherFake>!
    private let tweetStub = Tweet.getFakedArray(amount: 4)
    private let analysisStub = SentimentAnalysis.getFakedItem()
    private var dispatcherFake: DispacherFake!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchTweet() {
        dispatcherFake = DispacherFake(model: tweetStub)
        sut = TweetRemoteDataSource(dispatcher: dispatcherFake)
        XCTAssertEqual(try sut.searchTweets(by: "SwiftLang").toBlocking(timeout: 0.1).first(), tweetStub)
    }

    func testAnalyzeText() {
        dispatcherFake = DispacherFake(data: ["result": analysisStub].data)
        sut = TweetRemoteDataSource(dispatcher: dispatcherFake)
        XCTAssertEqual(try sut.analyzeTweet(text: "Some random thing").toBlocking(timeout: 0.1).first(), analysisStub)
    }
}
