//
//  ForamtterTest.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import XCTest

class ForamtterTest: XCTestCase {
    var formatter: LineFormatter!

    override func setUp() {
        formatter = LineFormatter()
    }

    override func tearDown() {
        formatter = nil
    }

    func testLineFormatterWithStringShouldReturntFormattedString() {
        let title = "Label of item"
        let formatedTitle = formatter.addPaddingsAtEnd(to: title, padding: 15)

        XCTAssertEqual(formatedTitle, "Label of item  ", "Title should be formatted")
    }

    func testLineFormatterShouldReturnFormattedArray() {
        let titles = ["Label of item", "Quantity", "Unit price", "Total price"]

        let formatedHeaders = titles.map { formatter.addPaddingsAtEnd(to: $0, padding: 15) }
        let expectedResult = ["Label of item  ", "Quantity       ", "Unit price     ", "Total price    "]
        XCTAssertEqual(formatedHeaders, expectedResult, "Array of titles should be formatted")
    }
}
