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
    internal let evaluated = PublishSubject<[TweetViewModel]>()
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
                    .do(onNext: { self.evaluated.onNext($0) })
                    .asDriver(onErrorJustReturn: [])
            }
    }

    internal func evaluation(in input: Input, _ indicator: ActivityIndicator) -> Driver<[TweetViewModel]> {
        input.selection
            .withLatestFrom(evaluated.startWith([]).asDriver(onErrorJustReturn: [])) { ($0, $1) }
            .flatMapLatest { value -> Driver<[TweetViewModel]> in
                var (index, array) = value
                return self.analysisCase.execute(array[index].text)
                        .trackActivity(indicator)
                        .flatMapLatest { analysis -> Driver<[TweetViewModel]> in
                            array[index].analysis = analysis
                            self.evaluated.onNext(array)
                            return Driver.just(array)
                        }.asDriver(onErrorJustReturn: [])
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
