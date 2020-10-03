//
//  TweetRepository.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift

public protocol TweetRepository {

    func searchTweets(by username: String) -> Observable<[Tweet]>
}
