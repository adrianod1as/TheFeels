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
    init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating)
}

public class UserTweetsViewModel<SceneCoordinating: UserTweetsSceneCoordinating> {

    internal let coordinator: SceneCoordinating
    internal let useCase: SearchTweetsByUsernameUseCaseable

    public init(useCase: SearchTweetsByUsernameUseCaseable, coordinator: SceneCoordinating) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
}

extension UserTweetsViewModel: UserTweetsViewModeling {

    public func transform(input: Input) -> Output {
        Output(isLoading: .empty(), didSucceed: .empty(), didFail: .empty(), didNavigate: .empty())
    }

}
