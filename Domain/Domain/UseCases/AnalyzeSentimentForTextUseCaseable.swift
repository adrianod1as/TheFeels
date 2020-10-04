//
//  AnalyzeSentimentForTextUseCaseable.swift
//  Domain
//
//  Created by Adriano Dias on 04/10/20.
//

import RxSwift

public protocol AnalyzeSentimentForTextUseCaseable: AnyObject {

    func execute(_ text: String) -> Observable<SentimentAnalysis>
}
