//
//  Tweet.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

public struct Tweet: Codable, Equatable {

    public let id: Int
    public let text: String
    public let createdAt: String
    public let user: User

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
    }
}
