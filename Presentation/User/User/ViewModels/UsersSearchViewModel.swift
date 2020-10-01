//
//  UsersSearchViewModel.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities
import Domain
import Common

protocol UsersSearchViewModelHolding {

    associatedtype SceneCoordinating: UsersSearchSceneCoordinating
    var coordinator: SceneCoordinating { get }
    var useCase: SearchUserByNameUseCaseable { get }
    init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating)
}

public class UsersSearchViewModel<SceneCoordinating: UsersSearchSceneCoordinating> {

    internal let coordinator: SceneCoordinating
    internal let useCase: SearchUserByNameUseCaseable

    public init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
}

extension UsersSearchViewModel: UsersSearchViewModeling {

    internal func users(in input: Input, _ indicator: ActivityIndicator) -> Driver<[UserViewModel]> {
        input.name
            .throttle(.milliseconds(500))
            .distinctUntilChanged()
            .flatMapLatest {
                self.useCase.execute($0)
                    .trackActivity(indicator)
                    .map({ $0.asViewModels })
                    .asDriver(onErrorJustReturn: [])
            }
    }

    internal func navigation(in input: Input, withLatestFrom users: Driver<[UserViewModel]>) -> Driver<Void> {
        input.selection
            .withLatestFrom(users) { $1[$0] }
            .flatMapLatest { self.coordinator.rx.show(user: $0).asDriver(onErrorJustReturn: ()) }
    }

    public func transform(input: Input) -> Output {
        let indicator = ActivityIndicator()
        let didSucceed = users(in: input, indicator)
        let didNavigate = navigation(in: input, withLatestFrom: didSucceed)
        return Output(isLoading: indicator.asDriver(), didSucceed: didSucceed, didFail: .empty(), didNavigate: didNavigate)
    }

}
