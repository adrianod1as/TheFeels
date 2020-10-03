//
//  TweetRepository.swift
//  AppData
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift
import Domain

public class TweetRepository {

    internal let remoteDataSource: TweetRemoteDataSource

    public init(remoteDataSource: TweetRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

extension TweetRepository: Domain.TweetRepository {

    public func searchTweets(by username: String) -> Observable<[Tweet]> {
        remoteDataSource.searchTweets(by: username)
    }
}
