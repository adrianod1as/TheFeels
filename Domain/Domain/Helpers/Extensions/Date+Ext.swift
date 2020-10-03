//
//  Date+Ext.swift
//  Domain
//
//  Created by Adriano Dias on 03/10/20.
//

import Foundation

public extension String {

    var asTwitterDate: Date? {
        DateFormatter.twitter.date(from: self)
    }
}

public extension Date {

    var asTwitterDateString: String? {
        DateFormatter.twitter.string(from: self)
    }
}

public extension DateFormatter {

    static var twitter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = L10n.Twitter.Date.format
        formatter.locale = .twitter
        return formatter
    }
}

public extension Locale {

    static var twitter: Locale {
        Locale(identifier: L10n.Twitter.Date.locale)
    }
}
