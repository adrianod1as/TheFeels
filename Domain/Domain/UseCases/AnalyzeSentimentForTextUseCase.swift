//
//  AnalyzeSentimentForTextUseCase.swift
//  Domain
//
//  Created by Adriano Dias on 04/10/20.
//

import RxSwift

public class AnalyzeSentimentForTextUseCase {

    internal let repository: TweetRepository

    public init(repository: TweetRepository) {
        self.repository = repository
    }
}

extension AnalyzeSentimentForTextUseCase: AnalyzeSentimentForTextUseCaseable {

    public func execute(_ text: String) -> Observable<SentimentAnalysis> {
        guard !text.isEmpty else {
            return .error(InteractionError.failedRequest(L10n.Error.Message.requiment))
        }
        return repository.analyzeTweet(text: text)
    }
}
