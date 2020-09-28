//
//  SearchUserByNameUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift

public class SearchUserByNameUseCase {

    private let repository: UserRepository

    public init(repository: UserRepository) {
        self.repository = repository
    }
}

extension SearchUserByNameUseCase: SearchUserByNameUseCaseable {

    public func execute(_ name: String) -> Observable<[User]> {
        repository.searchUser(by: name)
    }
}
