//
//  AnalyzeSentimentForTextUseCaseableSpy.swift
//  TweetTests
//
//  Created by Adriano Dias on 04/10/20.
//

import RxSwift
@testable import Domain

class AnalyzeSentimentForTextUseCaseableSpy: AnalyzeSentimentForTextUseCaseable {

    let analysis = SentimentAnalysis.getFakedItem()
    var executionCalled = false

    func execute(_ text: String) -> Observable<SentimentAnalysis> {
        executionCalled.toggle()
        return .just(analysis)
    }
}
