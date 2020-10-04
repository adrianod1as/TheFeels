//
//  Tweet+Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

import Fakery

extension Tweet: Fakeable {

    public var shouldBeUnique: Bool {
        true
    }

    public var uniquesId: [String] {
        [id.description]
    }

    public static func getFakedItem() -> Tweet {
        let faker = Faker.brazilian
        return Tweet(id: faker.number.randomInt(), text: faker.lorem.paragraph(),
                     createdAt: Date().asTwitterDateString ?? String(), user: User.getFakedItem())
    }

}
