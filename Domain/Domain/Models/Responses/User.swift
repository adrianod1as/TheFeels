//
//  User.swift
//  Domain
//
//  Created by Adriano Dias on 28/09/20.
//

public struct User: Codable, Equatable {

    public let id: Int
    public let name: String
    public let screenName: String
    public let profileImageUrl: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case profileImageUrl = "profile_image_url_https"
    }
}
