//
//  UserTweetsViewModel.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
import RxTest
import RxSwiftUtilities
@testable import Common
@testable import Domain
@testable import Tweet

class UserTweetsViewModelTests: XCTestCase {

    var useCaseSpy: SearchTweetsByUsernameUseCaseSpy!
    var coordinatorSpy: UserTweetsSceneCoordinatingSpy!
    var sut: UserTweetsViewModel<UserTweetsSceneCoordinatingSpy>!
    var input: UserTweetsViewModeling.Input!

    override func setUp() {
        super.setUp()

        useCaseSpy = SearchTweetsByUsernameUseCaseSpy()
        coordinatorSpy = UserTweetsSceneCoordinatingSpy()
        sut = UserTweetsViewModel(useCase: useCaseSpy, coordinator: coordinatorSpy)
        input = UserTweetsViewModelInput(viewDidLoad: .just(()), selection: .just(0))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTweets() {
        XCTAssertEqual(try getTweets().toBlocking(timeout: 0.1).first(), useCaseSpy.tweets.asViewModels)
        XCTAssert(useCaseSpy.executionCalled)
    }

    private func getTweets() -> Driver<[TweetViewModel]> {
        let indicator = ActivityIndicator()
        return sut.tweets(in: input, indicator)
    }
}
