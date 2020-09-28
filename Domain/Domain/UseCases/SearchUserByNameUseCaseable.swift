//
//  SearchUserByNameUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift

public protocol SearchUserByNameUseCaseable: AnyObject {

    func execute(_ name: String) -> Observable<[User]>
}
