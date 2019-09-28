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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDiscountFromTotalCostShouldCalculating() {
        
        let discount = Discount()
        let calculatedDiscount = discount.calculatingFrom(totalCost: 20500.0)
        
        XCTAssertEqual(calculatedDiscount.discount, 0.1, "Discount in rersents value should be the same")
        XCTAssertEqual(calculatedDiscount.totalDiscount, 2050.00, "Total discount value should be the same")
    }
    


}
