//
//  TweetRemoteDataSourceSpy.swift
//  AppDataTests
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift
import Domain
@testable import AppData

class TweetRemoteDataSourceSpy: TweetRemoteDataSource {

    let tweets = Tweet.getFakedArray(amount: 4)
    var searchTweetsCalled = false

    func searchTweets(by username: String) -> Observable<[Tweet]> {
        searchTweetsCalled.toggle()
        return .just(tweets)
    }
}
