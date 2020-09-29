//
//  UsersSceneCoordinating.swift
//  User
//
//  Created by Adriano Dias on 29/09/20.
//

import RxSwift

public protocol UsersSceneCoordinating where Self: ReactiveCompatible, ReactiveBase: UsersSceneCoordinating   {

    func show(user: UserViewModel)
}

public extension Reactive where Base: UsersSceneCoordinating {

    func show(user: UserViewModel) -> Observable<Void> {
        Observable.create { observer in
            self.base.show(user: user)
            observer.onNext(())
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
