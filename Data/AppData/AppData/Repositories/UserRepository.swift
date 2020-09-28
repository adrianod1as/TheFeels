//
//  UserRepository.swift
//  AppData
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift
import Domain

public class UserRepository {

    internal let remoteDataSource: UserRemoteDataSource

    public init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

extension UserRepository: Domain.UserRepository {

    public func searchUser(by name: String) -> Observable<[User]> {
        remoteDataSource.searchUser(by: name)
    }
}
