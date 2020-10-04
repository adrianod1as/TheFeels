//
//  TweetRemoteDataSource.swift
//  Networking
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift
import OxeNetworking
import AppData
import Domain

public class TweetRemoteDataSource<T: RxDispatcher> {

    internal let dispatcher: T

    public init(dispatcher: T) {
        self.dispatcher = dispatcher
    }
}

extension TweetRemoteDataSource: AppData.TweetRemoteDataSource {

    public func searchTweets(by username: String) -> Observable<[Tweet]> {
        dispatcher.rx.getDecodable([Tweet].self, from: TweetsTarget.search(username: username)).asObservable()
    }

    public func analyzeTweet(text: String) -> Observable<SentimentAnalysis> {
        dispatcher.rx.getDecodable(SentimentAnalysis.self, from: SentimentTarget.analyze(text: text)).asObservable()
    }
}
