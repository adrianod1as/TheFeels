//
//  SentimentAnalysis.swift
//  Domain
//
//  Created by Adriano Dias on 04/10/20.
//

public struct SentimentAnalysis: Codable, Equatable {

    public let polarity: Double
    public let type: Sentiment

    enum CodingKeys: String, CodingKey {
        case polarity, type
    }

    public init(polarity: Double) {
        self.polarity = polarity
        self.type = Sentiment(polarity: polarity)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        polarity = try container.decode(Double.self, forKey: .polarity)
        type = Sentiment(polarity: polarity)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(polarity, forKey: .polarity)
        try container.encode(type.rawValue, forKey: .type)
    }
}
