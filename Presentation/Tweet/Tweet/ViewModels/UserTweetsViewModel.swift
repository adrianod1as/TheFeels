//
//  UserTweetsViewModel.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities
import Domain
import Common

protocol UserTweetsViewModelHolding {

    associatedtype SceneCoordinating: UserTweetsSceneCoordinating
    var coordinator: SceneCoordinating { get }
    var tweetsCase: SearchTweetsByUsernameUseCaseable { get }
    var analysisCase: AnalyzeSentimentForTextUseCaseable { get }
    var user: User? { get set }
    init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating)
}

public class UserTweetsViewModel<SceneCoordinating: UserTweetsSceneCoordinating> {

    internal let coordinator: SceneCoordinating
    internal let tweetsCase: SearchTweetsByUsernameUseCaseable
    internal let analysisCase: AnalyzeSentimentForTextUseCaseable
    internal let evaluated = BehaviorRelay<[TweetViewModel]>(value: [])
    public var user: User?

    public init(useCase: SearchTweetsByUsernameUseCaseable,
                analysisCase: AnalyzeSentimentForTextUseCaseable, coordinator: SceneCoordinating) {
        self.tweetsCase = useCase
        self.coordinator = coordinator
        self.analysisCase = analysisCase
    }
}

extension UserTweetsViewModel: UserTweetsViewModeling {

    internal func tweets(in input: Input,
                         _ indicator: ActivityIndicator) -> Driver<[TweetViewModel]> {
        input.viewDidLoad
            .map({ self.user?.screenName ?? String() })
            .flatMapLatest {
                self.tweetsCase.execute($0)
                    .trackActivity(indicator)
                    .map({ $0.asViewModels })
                    .do(onNext: { self.evaluated.accept($0) })
                    .asDriver(onErrorJustReturn: [])
            }
    }

    internal func evaluation(in input: Input, _ indicator: ActivityIndicator) -> Driver<[TweetViewModel]> {
        input.selection
            .distinctUntilChanged()
            .withLatestFrom(evaluated.startWith([]).asDriver(onErrorJustReturn: [])) { ($0, $1) }
            .filter({ $1[$0].analysis == nil })
            .flatMap { (index, tweets) -> Driver<[TweetViewModel]> in
                return self.analysisCase.execute(tweets[index].text)
                        .trackActivity(indicator)
                        .flatMap { analysis -> Driver<[TweetViewModel]> in
                            var evaluatedTweets = self.evaluated.value
                            evaluatedTweets[index].analysis = analysis
                            self.evaluated.accept(evaluatedTweets)
                            return Driver.just(evaluatedTweets)
                        }.asDriver(onErrorJustReturn: tweets)
            }
    }

    public func transform(input: Input) -> Output {
        let indicator = ActivityIndicator()
        let nonEvaluated = tweets(in: input, indicator).startWith([])
        let evaluate = evaluation(in: input, indicator).startWith([])
        let didSucceed = Driver.merge(nonEvaluated, evaluate)
        return Output(isLoading: indicator.asDriver(), didSucceed: didSucceed,
                      didFail: .empty(), didNavigate: .empty())
    }

}
