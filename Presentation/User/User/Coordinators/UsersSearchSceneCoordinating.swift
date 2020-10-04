//
//  UsersSearchSceneCoordinating.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import Common

public protocol UsersSearchSceneCoordinating where Self: ReactiveCompatible, ReactiveBase: UsersSearchSceneCoordinating {

    func showTweets(for user: UserViewModel)
}

public extension Reactive where Base: UsersSearchSceneCoordinating {

    func showTweets(for user: UserViewModel) -> Observable<Void> {
        Observable.create { observer in
            self.base.showTweets(for: user)
            observer.onNext(())
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
