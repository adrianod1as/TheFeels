//
//  Fakery+Extensions.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Fakery

public extension Faker {

    static var brazilian: Faker {
        return Faker(locale: L10n.Symbol.locale)
    }

}

public extension Faker.Name {

    func givenName() -> String {
        return "\(firstName()) \(lastName())"
    }
}
