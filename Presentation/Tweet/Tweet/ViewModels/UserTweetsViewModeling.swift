//
//  UserTweetsViewModeling.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import RxCocoa
import Common

public protocol UserTweetsViewModeling {

    typealias Input = UserTweetsViewModelingInput
    typealias Output = UserTweetsViewModelOutput

    func transform(input: Input) -> Output
}

public protocol UserTweetsViewModelingInput {

    var viewDidLoad: Driver<Void> { get }
    var selection: Driver<Int> { get }
}

public struct UserTweetsViewModelInput: UserTweetsViewModelingInput {

    public let viewDidLoad: Driver<Void>
    public let selection: Driver<Int>
}

public protocol UserTweetsViewModelingOutput: CommonSceneOutput where Success == [TweetViewModel] {

    var didNavigate: Driver<Void> { get }
}

public struct UserTweetsViewModelOutput: UserTweetsViewModelingOutput {

    public let isLoading: Driver<Bool>

    public let didSucceed: Driver<[TweetViewModel]>

    public let didFail: Driver<String>

    public let didNavigate: Driver<Void>

}
