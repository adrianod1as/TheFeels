//
//  Sentiment.swift
//  Domain
//
//  Created by Adriano Dias on 04/10/20.
//

public enum Sentiment: String, CaseIterable {
    case positive
    case neutral
    case negative

    init(polarity: Double) {
        if polarity > 0 {
            self = .positive
        } else if polarity < 0 {
            self = .negative
        } else {
            self = .neutral
        }
    }
}
