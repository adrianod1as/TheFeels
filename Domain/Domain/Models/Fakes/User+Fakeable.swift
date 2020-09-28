//
//  User+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 28/09/20.
//

import Fakery

extension User: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [id.description]
    }

    public static func getFakedItem() -> User {
        let faker = Faker.brazilian
        return User(id: faker.number.randomInt(), name: faker.name.name(),
                    screenName: faker.internet.username(), profileImageUrl: L10n.User.ProfileImageUrl.sample)
    }

}
