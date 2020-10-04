//
//  SearchTweetsByUsernameUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

import RxSwift

public class SearchTweetsByUsernameUseCase {

    internal let repository: TweetRepository

    public init(repository: TweetRepository) {
        self.repository = repository
    }
}

extension SearchTweetsByUsernameUseCase: SearchTweetsByUsernameUseCaseable {

    public func execute(_ username: String) -> Observable<[Tweet]> {
        guard !username.isEmpty else {
            return .error(InteractionError.failedRequest(L10n.Error.Message.requiment))
        }
        guard username.wordsBySpace.count == 1 else {
            return .error(InteractionError.failedRequest(L10n.Error.Message.Username.multipleWords))
        }
        return repository.searchTweets(by: username)
    }
}
