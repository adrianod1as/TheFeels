//
//  UserRemoteDataSource.swift
//  Networking
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift
import OxeNetworking
import AppData
import Domain

public class UserRemoteDataSource<T: RxDispatcher> {

    internal let dispatcher: T

    public init(dispatcher: T) {
        self.dispatcher = dispatcher
    }
}

extension UserRemoteDataSource: AppData.UserRemoteDataSource {

    public func searchUser(by name: String) -> Observable<[User]> {
        dispatcher.rx.getDecodable([User].self, from: UsersTarget.search(username: name)).asObservable()
    }
}
