//
//  TweetRepositorySpy.swift
//  DomainTests
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift
@testable import Domain

class TweetRepositorySpy: TweetRepository {

    let tweets = Tweet.getFakedArray(amount: 4)
    let sentimentAnalysis = SentimentAnalysis.getFakedItem()
    var searchTweetsCalled = false
    var analyzeTweetForTextCalled = false

    func searchTweets(by username: String) -> Observable<[Tweet]> {
        searchTweetsCalled.toggle()
        return .just(tweets)
    }

    func analyzeTweet(text: String) -> Observable<SentimentAnalysis> {
        analyzeTweetForTextCalled.toggle()
        return .just(sentimentAnalysis)
    }
}
