//
//  UserRepository.swift
//  Domain
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift

public protocol UserRepository {

    func searchUser(by name: String) -> Observable<[User]>
}
