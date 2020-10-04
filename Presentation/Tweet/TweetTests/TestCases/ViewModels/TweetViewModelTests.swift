//
//  TweetViewModelTests.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

import XCTest
@testable import Common
@testable import Domain
@testable import Tweet

class TweetViewModelTests: XCTestCase {

    var useCaseSpy: SearchTweetsByUsernameUseCaseSpy!
    var stub: Tweet!
    var sut: TweetViewModel!
    var input: UserTweetsViewModeling.Input!

    override func setUp() {
        super.setUp()

        stub = Tweet.getFakedItem()
        sut = TweetViewModel(tweet: stub)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIdentity() {
        XCTAssertEqual(sut.identity, stub.id.description)
    }

    func testDate() {
        XCTAssertEqual(sut.date, dateForStub())
    }
    func testText() {
        XCTAssertEqual(sut.text, stub.text)
    }

    func testSubtitle() {
        XCTAssertEqual(sut.subTitle, "\(stub.user.asViewModel.username) - \(dateForStub())")
    }

    private func dateForStub() -> String {
        stub.createdAt.asTwitterDate?.with(formart: Domain.L10n.Brazil.Date.format) ?? String()
    }
}
