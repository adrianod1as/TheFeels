//
//  DateExtensionsTests.swift
//  DomainTests
//
//  Created by Adriano Dias on 03/10/20.
//

import XCTest
@testable import Domain

class DateExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTwitterDateFormatter() {
        XCTAssertEqual(DateFormatter.twitter.dateFormat, "EEE MMM dd HH:mm:ss Z yyyy")
        XCTAssertEqual(DateFormatter.twitter.locale.identifier, "en_US_POSIX")
    }

    func testTwitterDateString() {
        let dateComponents = DateComponents(calendar: .current, year: 2020, month: 10,
                                            day: 3, hour: 11, minute: 15, second: 55)
        let date = Calendar.current.date(from: dateComponents)
        XCTAssertEqual(date?.asTwitterDateString, "Sat Oct 03 11:15:55 -0300 2020")
    }

    func testTwitterDateObject() {
        let dateComponents = DateComponents(calendar: .current, year: 2020, month: 10,
                                            day: 3, hour: 11, minute: 15, second: 55)
        let date = Calendar.current.date(from: dateComponents)
        XCTAssertEqual("Sat Oct 03 11:15:55 -0300 2020".asTwitterDate, date)
    }
}
