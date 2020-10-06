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
            .withLatestFrom(evaluated.startWith([]).asDriver(onErrorJustReturn: [])) { ($0, $1) }
            .distinctUntilChanged({ $1[$0] })
            .filter({ $1[$0].analysis == nil })
            .flatMap { (index, tweets) -> Driver<[TweetViewModel]> in
                return self.analysisCase.execute(tweets[index].text)
                        .trackActivity(indicator)
                        .flatMap { analysis -> Driver<[TweetViewModel]> in
                            self.set(analysis: analysis, for: index)
                            return Driver.just(self.evaluated.value)
                        }.asDriver { _ -> Driver<[TweetViewModel]> in
                            self.set(analysis: nil, for: index)
                            return Driver.just(self.evaluated.value)
                        }
            }
    }

    private func set(analysis: SentimentAnalysis?, for index: Int) {
        var evaluatedTweets = self.evaluated.value
        evaluatedTweets[index].analysisFailed = analysis == nil
        if let analysis = analysis {
            evaluatedTweets[index].analysis = analysis
        }
        self.evaluated.accept(evaluatedTweets)
    }

    public func transform(input: Input) -> Output {
        let isLoading = ActivityIndicator()
        let isEvaluating = ActivityIndicator()
        let nonEvaluated = tweets(in: input, isLoading).startWith([])
        let evaluate = evaluation(in: input, isEvaluating).startWith([])
        let didSucceed = Driver.merge(nonEvaluated, evaluate)
        return Output(isLoading: isLoading.asDriver().distinctUntilChanged(), didSucceed: didSucceed,
                      didFail: .empty(), isEvaluating: isEvaluating.asDriver().distinctUntilChanged())
    }

}
