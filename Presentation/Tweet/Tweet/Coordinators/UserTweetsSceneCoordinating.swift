//
//  UserTweetsSceneCoordinating.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import Common

public protocol UserTweetsSceneCoordinating where Self: ReactiveCompatible, ReactiveBase: UserTweetsSceneCoordinating {

    func showSentiment(for tweet: TweetViewModel)
}

public extension Reactive where Base: UserTweetsSceneCoordinating {

    func show(user: TweetViewModel) -> Observable<Void> {
        Observable.create { observer in
            self.base.showSentiment(for: user)
            observer.onNext(())
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
