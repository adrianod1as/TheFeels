//
//  Array+Fakery.swift
//  Domain
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Fakery

extension Array: Fakeable where Element: Fakeable {

    static public var defaultRangeForArray: ClosedRange<Int> {
        return 1...1
    }

    public var shouldBeUnique: Bool {
        return false
    }

    public var uniquesId: [String] {
        return map({ $0.uniquesId.joined() })
    }

    public static func getFakedItem() -> [Element] {
        return Element.getFakedArray(min: Element.defaultRangeForArray.lowerBound,
                                     max: Element.defaultRangeForArray.upperBound)
    }

}
