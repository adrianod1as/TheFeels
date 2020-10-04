//
//  TweetCoordinatorTests.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

import XCTest
@testable import Tweet
@testable import Domain

class TweetCoordiantorTests: XCTestCase {

    var departingCoordinatorStub: TweetsDepartingCoordinatingStub!
    var sut: TweetsCoordinator!
    var factorySpy: TweetsManufacturingSpy!

    override func setUp() {
        super.setUp()

        factorySpy = TweetsManufacturingSpy()
        departingCoordinatorStub = TweetsDepartingCoordinatingStub()
        sut = TweetsCoordinator(navigationController: UINavigationController(),
                               departingCoordinator: departingCoordinatorStub, factory: factorySpy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShowTweets() {
        sut.showTweets(for: User.getFakedItem().asViewModel)
        XCTAssert(factorySpy.makeUserTweetsViewControllerCalled)
    }
}
