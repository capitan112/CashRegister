//
//  DiscountTet.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 28/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

@testable import CashRegister
import XCTest

class DiscountTest: XCTestCase {
    var discount: Discount!

    override func setUp() {
        discount = Discount()
    }

    override func tearDown() {
        discount = nil
    }

    func testDiscountFromTotalCostShouldCalculating() {
        let percentageDiscount = discount.percentageDiscount(from: 20500.0)
        let amountOfDiscount = discount.amountOfDiscount(from: 20500.0)

        XCTAssertEqual(percentageDiscount, 0.1, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 2050.00, "amount of total discount value should be the same")
    }

    func testDiscountPriceShouldBeZeroWhenItAbout1000() {
        let percentageDiscount = discount.percentageDiscount(from: 1000)
        let amountOfDiscount = discount.amountOfDiscount(from: 1000)

        XCTAssertEqual(percentageDiscount, 0.00, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 0.00, "amount of total discount value should be the same")
    }

    func testDiscountPriceShouldBeThreeWhenItAfter1000() {
        let percentageDiscount = discount.percentageDiscount(from: 1001)
        let amountOfDiscount = discount.amountOfDiscount(from: 1001)

        XCTAssertEqual(percentageDiscount, 0.03, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 30.029999999999998, "amount of total discount value should be the same")
    }

    func testDiscountPriceShouldBeFiveWhenItAfter5000() {
        let percentageDiscount = discount.percentageDiscount(from: 5001)
        let amountOfDiscount = discount.amountOfDiscount(from: 5001)

        XCTAssertEqual(percentageDiscount, 0.05, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 250.05, "amount of total discount value should be the same")
    }

    func testDiscountPriceShouldBeSevenWhenItAfter7000() {
        let percentageDiscount = discount.percentageDiscount(from: 7001)
        let amountOfDiscount = discount.amountOfDiscount(from: 7001)

        XCTAssertEqual(percentageDiscount, 0.07, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 490.07000000000005, "amount of total discount value should be the same")
    }

    func testDiscountPriceShouldBeTenWhenItAfter10000() {
        let percentageDiscount = discount.percentageDiscount(from: 10001)
        let amountOfDiscount = discount.amountOfDiscount(from: 10001)

        XCTAssertEqual(percentageDiscount, 0.1, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 1000.1, "amount of total discount value should be the same")
    }

    func testDiscountPriceShouldBeFifteenWhenItAfter50000() {
        let percentageDiscount = discount.percentageDiscount(from: 50001)
        let amountOfDiscount = discount.amountOfDiscount(from: 50001)

        XCTAssertEqual(percentageDiscount, 0.15, "Discount in persents value should be the same")
        XCTAssertEqual(amountOfDiscount, 7500.15, "amount of total discount value should be the same")
    }
}
