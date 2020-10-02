//
//  CommonSceneOutput.swift
//  Common
//
//  Created by Adriano Dias on 29/09/20.
//

import RxCocoa

public protocol LoadableOutput {

    var isLoading: Driver<Bool> { get }
}

public protocol FailureOutput {

    var didFail: Driver<String> { get }
}

public protocol SuccessOutput {

    associatedtype Success

    var didSucceed: Driver<Success> { get }
}

public protocol CommonSceneOutput: LoadableOutput, SuccessOutput, FailureOutput {}
