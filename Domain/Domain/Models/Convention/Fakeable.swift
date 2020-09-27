//
//  Fakeable.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import UIKit
import Fakery

public protocol Uniqueable {

    var shouldBeUnique: Bool { get }
    var uniqueId: String { get }
}

public protocol Fakeable {

    var shouldBeUnique: Bool { get }
    var uniquesId: [String] { get }
    static var defaultRangeForArray: ClosedRange<Int> { get }
    static func getFakedItem() -> Self
    static func getFakedArray(min: Int, max: Int) -> [Self]
    static func getFakedArray(range: ClosedRange<Int>) -> [Self]
    static func getFakedArray(amount: Int) -> [Self]
}

public extension Fakeable {

    static var defaultRangeForArray: ClosedRange<Int> {
        return 4...16
    }

    static func getFakedArray(min: Int, max: Int) -> [Self] {
        return getFakedArray(amount: Faker.brazilian.number.randomInt(min: min, max: max))
    }

    static func getFakedArray(range: ClosedRange<Int>) -> [Self] {
        return getFakedArray(min: range.lowerBound, max: range.upperBound)
    }

    static func getFakedArray(amount: Int) -> [Self] {
        var items = [Self]()
        var index = 0
        while index < amount {
            let item = getFakedItem()
            if !item.shouldBeUnique || items.filter({ $0.uniquesId == item.uniquesId }).first == nil {
                items.append(item)
                index += 1
            }
        }
        return items
    }
}
