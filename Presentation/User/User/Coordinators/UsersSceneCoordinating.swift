//
//  UsersSceneCoordinating.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift
import Common

public protocol UsersSceneCoordinating where Self: ReactiveCompatible, ReactiveBase: UsersSceneCoordinating {

    func showTweets(for user: UserViewModel)
}

public extension Reactive where Base: UsersSceneCoordinating {

    func show(user: UserViewModel) -> Observable<Void> {
        Observable.create { observer in
            self.base.showTweets(for: user)
            observer.onNext(())
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
