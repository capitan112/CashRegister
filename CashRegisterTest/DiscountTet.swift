//
//  DiscountTet.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 28/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

@testable import CashRegister
import XCTest

class DiscountTet: XCTestCase {

    var discount: Discount!
    
    override func setUp() {
        discount = Discount()
    }

    override func tearDown() {
        discount = nil
    }

    func testDiscountFromTotalCostShouldCalculating() {
        let calculatedDiscount = discount.calculatingFrom(totalCost: 20500.0)
        
        XCTAssertEqual(calculatedDiscount.discount, 0.1, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 2050.00, "Total discount value should be the same")
    }
    
    func testDiscountPriceShouldBeZeroWhenItAbout1000() {
        
        let calculatedDiscount = discount.calculatingFrom(totalCost: 1000)
        
        XCTAssertEqual(calculatedDiscount.discount, 0.0, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 0.00, "Total discount value should be the same")
    }
    
    func testDiscountPriceShouldBeThreeWhenItAfter1000() {
          let calculatedDiscount = discount.calculatingFrom(totalCost: 1001)
          XCTAssertEqual(calculatedDiscount.discount, 0.03, "Discount in rersents value should be the same")
          XCTAssertEqual(calculatedDiscount.totalDiscount, 30.029999999999998, "Total discount value should be the same")
      }
    
    func testDiscountPriceShouldBeFiveWhenItAfter5000() {
        
        let calculatedDiscount = discount.calculatingFrom(totalCost: 5001)
        XCTAssertEqual(calculatedDiscount.discount, 0.05, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 250.05, "Total discount value should be the same")
     }
    
    
    func testDiscountPriceShouldBeSevenWhenItAfter7000() {
        let calculatedDiscount = discount.calculatingFrom(totalCost: 7001)
        XCTAssertEqual(calculatedDiscount.discount, 0.07, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 490.07000000000005, "Total discount value should be the same")
    }

    func testDiscountPriceShouldBeTenWhenItAfter10000() {
        let calculatedDiscount = discount.calculatingFrom(totalCost: 10001)
        XCTAssertEqual(calculatedDiscount.discount, 0.1, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 1000.1, "Total discount value should be the same")
    }

    func testDiscountPriceShouldBeFifteenWhenItAfter50000() {
        let calculatedDiscount = discount.calculatingFrom(totalCost: 50001)
        XCTAssertEqual(calculatedDiscount.discount, 0.15, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 7500.15, "Total discount value should be the same")
    }

}
