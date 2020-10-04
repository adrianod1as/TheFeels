//
//  SearchTweetsByUsernameUseCase.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

import RxSwift
@testable import Domain

class SearchTweetsByUsernameUseCaseSpy: SearchTweetsByUsernameUseCaseable {

    let tweets = Tweet.getFakedArray(amount: 4)
    var executionCalled = false

    func execute(_ username: String) -> Observable<[Tweet]> {
        executionCalled.toggle()
        return .just(tweets)
    }
}
