//
//  TweetRemoteDataSource.swift
//  AppData
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift
import Domain

public protocol TweetRemoteDataSource: AnyObject {

    func searchTweets(by username: String) -> Observable<[Tweet]>
    func analyzeTweet(text: String) -> Observable<SentimentAnalysis>
}
