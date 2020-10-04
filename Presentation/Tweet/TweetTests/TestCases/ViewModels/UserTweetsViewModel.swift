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

    var bag: DisposeBag!
    var scheduler: TestScheduler!
    var tweetsUseCaseSpy: SearchTweetsByUsernameUseCaseSpy!
    var analysisUseCaseSpy: AnalyzeSentimentForTextUseCaseableSpy!
    var coordinatorSpy: UserTweetsSceneCoordinatingSpy!
    var sut: UserTweetsViewModel<UserTweetsSceneCoordinatingSpy>!
    var viewDidLoad: PublishSubject<Void>!
    var selection: PublishSubject<Int>!
    var input: UserTweetsViewModeling.Input!

    override func setUp() {
        super.setUp()

        bag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
        tweetsUseCaseSpy = SearchTweetsByUsernameUseCaseSpy()
        coordinatorSpy = UserTweetsSceneCoordinatingSpy()
        analysisUseCaseSpy = AnalyzeSentimentForTextUseCaseableSpy()
        viewDidLoad = PublishSubject<Void>()
        selection = PublishSubject<Int>()
        sut = UserTweetsViewModel(useCase: tweetsUseCaseSpy,
                                  analysisCase: analysisUseCaseSpy, coordinator: coordinatorSpy)
        input = UserTweetsViewModelInput(viewDidLoad: viewDidLoad.startWith(()).asDriver(onErrorJustReturn: ()),
                                         selection: selection.asDriver(onErrorJustReturn: 0))
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTweets() {
        XCTAssertEqual(try sut.tweets(in: input, ActivityIndicator()).toBlocking(timeout: 0.1).first(),
                       tweetsUseCaseSpy.tweets.asViewModels)
    }

    func testEvaluation() {
        let nonEvaluation = scheduler.createObserver([TweetViewModel].self)
        let evaluation = scheduler.createObserver([TweetViewModel].self)
        let indicator = ActivityIndicator()
        sut.tweets(in: input, indicator).drive(nonEvaluation).disposed(by: bag)
        sut.evaluation(in: input, indicator).drive(evaluation).disposed(by: bag)
        scheduler.createColdObservable([.next(0, ())])
            .bind(to: viewDidLoad)
            .disposed(by: bag)
        scheduler.createColdObservable([.next(10, 0)])
            .bind(to: selection)
            .disposed(by: bag)
        scheduler.start()
        XCTAssertFalse(evaluation.events.isEmpty)
        XCTAssertNotNil(evaluation.events.first?.value.element?.first?.analysis)
    }
}
