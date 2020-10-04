//
//  Tweet.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

public struct Tweet: Codable {

    public let id: Int
    public let text: String
    public let createdAt: String
    public let user: User

    enum CodingKeys: String, CodingKey {
        case id, text, user
        case createdAt = "created_at"
    }
}

extension Tweet: Equatable {

    static public func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
