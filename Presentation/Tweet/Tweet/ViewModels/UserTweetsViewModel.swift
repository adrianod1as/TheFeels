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
    var useCase: SearchUserByNameUseCaseable { get }
    init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating)
}

public class UserTweetsViewModel<SceneCoordinating: UserTweetsSceneCoordinating> {

    internal let coordinator: SceneCoordinating
    internal let useCase: SearchUserByNameUseCaseable

    public init(useCase: SearchUserByNameUseCaseable, coordinator: SceneCoordinating) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
}
