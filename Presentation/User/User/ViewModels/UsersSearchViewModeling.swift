//
//  UsersSearchViewModeling.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import RxCocoa
import Common

public protocol UsersSearchViewModeling {

    typealias Input = UsersSearchViewModelingInput
    typealias Output = UsersSearchViewModelOutput

    func transform(input: Input) -> Output
}

public protocol UsersSearchViewModelingInput {

    var name: Driver<String> { get }
    var selection: Driver<Int> { get }
}

public struct UsersSearchViewModelInput: UsersSearchViewModelingInput {

    public let name: Driver<String>
    public let selection: Driver<Int>
}

public protocol UsersSearchViewModelingOutput: CommonSceneOutput where Success == [UserViewModel] {

    var didNavigate: Driver<Void> { get }
}

public struct UsersSearchViewModelOutput: UsersSearchViewModelingOutput {

    public let isLoading: Driver<Bool>

    public let didSucceed: Driver<[UserViewModel]>

    public let didFail: Driver<String>

    public let didNavigate: Driver<Void>

}
