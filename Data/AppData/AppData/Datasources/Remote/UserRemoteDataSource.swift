//
//  UserRemoteDataSource.swift
//  AppData
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift
import Domain

public protocol UserRemoteDataSource: AnyObject {

    func searchUser(by name: String) -> Observable<[User]>
}
