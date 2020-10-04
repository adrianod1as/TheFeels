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
    var useCase: SearchTweetsByUsernameUseCaseable { get }
    var user: User? { get set }
    init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating)
}

public class UserTweetsViewModel<SceneCoordinating: UserTweetsSceneCoordinating> {

    internal let coordinator: SceneCoordinating
    internal let useCase: SearchTweetsByUsernameUseCaseable
    public var user: User?

    public init(useCase: SearchTweetsByUsernameUseCaseable, coordinator: SceneCoordinating) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
}

extension UserTweetsViewModel: UserTweetsViewModeling {

    internal func tweets(in input: Input, _ indicator: ActivityIndicator) -> Driver<[TweetViewModel]> {
        input.viewDidLoad
            .map({ self.user?.screenName ?? String() })
            .flatMapLatest {
                self.useCase.execute($0)
                    .trackActivity(indicator)
                    .map({ $0.asViewModels })
                    .asDriver(onErrorJustReturn: [])
            }
    }

    public func transform(input: Input) -> Output {
        let indicator = ActivityIndicator()
        let didSucceed = tweets(in: input, indicator)
        return Output(isLoading: indicator.asDriver(), didSucceed: didSucceed,
                      didFail: .empty(), didNavigate: .empty())
    }

}
