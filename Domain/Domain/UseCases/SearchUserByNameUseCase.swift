//
//  SearchUserByNameUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 28/09/20.
//

import RxSwift

public class SearchUserByNameUseCase {

    internal let repository: UserRepository

    public init(repository: UserRepository) {
        self.repository = repository
    }
}

extension SearchUserByNameUseCase: SearchUserByNameUseCaseable {

    public func execute(_ name: String) -> Observable<[User]> {
        guard !name.isEmpty else {
            return .error(InteractionError.failedRequest(L10n.Error.Message.requiment))
        }
        return repository.searchUser(by: name)
    }
}
