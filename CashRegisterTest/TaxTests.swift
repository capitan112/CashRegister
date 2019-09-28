//
//  TaxTests.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 28/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//
@testable import CashRegister
import XCTest

class TaxTests: XCTestCase {
    var tax: Tax!

    override func setUp() {
        tax = Tax(currentTax: .NV)
    }

    override func tearDown() {
        tax = nil
    }

    func testTaxShoudReturnForamttedStringWithEightPersents() {
        let expectedTitle = "Tax 8.00%"

        XCTAssertEqual(tax.taxInPercentage(), expectedTitle, "Tax in persents value should be the same")
    }

    func testTaxShoudReturnForamttedStringWithFourPersents() {
        tax = Tax(currentTax: .AL)
        let expectedTitle = "Tax 4.00%"

        XCTAssertEqual(tax.taxInPercentage(), expectedTitle, "Tax in persents value should be the same")
    }
}
