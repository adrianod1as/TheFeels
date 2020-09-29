//
//  UsersViewModeling.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import RxCocoa
import Common

public protocol UsersViewModeling {

    typealias Input = UsersViewModelingInput
    typealias Output = UsersViewModelOutput

    func transform(input: Input) -> Output
}

public protocol UsersViewModelingInput {

    var name: Driver<String> { get }
    var selection: Driver<Int> { get }
}

public struct UsersViewModelInput: UsersViewModelingInput {

    public let name: Driver<String>
    public let selection: Driver<Int>
}

public protocol UsersViewModelingOutput: CommonSceneOutput where Success == [UserViewModel] {

    var didNavigate: Driver<Void> { get }
}

public struct UsersViewModelOutput: UsersViewModelingOutput {

    public let isLoading: Driver<Bool>

    public let didSucceed: Driver<[UserViewModel]>

    public let didFail: Driver<String>

    public let didNavigate: Driver<Void>

}
