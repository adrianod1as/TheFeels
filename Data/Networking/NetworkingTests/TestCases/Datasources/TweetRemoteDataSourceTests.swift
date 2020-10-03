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
    private let stub = Tweet.getFakedArray(amount: 4)
    private var dispatcherFake: DispacherFake!

    override func setUp() {
        super.setUp()

        dispatcherFake = DispacherFake(model: stub)
        sut = TweetRemoteDataSource(dispatcher: dispatcherFake)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchTweet() {
        XCTAssertEqual(try sut.searchTweets(by: "SwiftLang").toBlocking(timeout: 0.1).first(), stub)
    }

}
