//
//  SentimentAnalysis.swift
//  Domain
//
//  Created by Adriano Dias on 04/10/20.
//

import Fakery

extension SentimentAnalysis: Fakeable {

    public var shouldBeUnique: Bool {
        false
    }

    public var uniquesId: [String] {
        [polarity.description]
    }

    public static func getFakedItem() -> SentimentAnalysis {
        SentimentAnalysis(polarity: Faker.brazilian.number.randomDouble(min: -1, max: 1).rounded())
    }

}
