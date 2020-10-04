//
//  UserTweetsSceneCoordinatingSpy.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

import RxSwift
@testable import Common
@testable import Tweet

class UserTweetsSceneCoordinatingSpy: ReactiveCompatible, UserTweetsSceneCoordinating {

    var showSentimentCalled = false

    func showSentiment(for tweet: TweetViewModel) {
        showSentimentCalled.toggle()
    }
}
