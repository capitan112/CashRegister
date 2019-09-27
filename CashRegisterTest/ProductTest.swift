//
//  ProductTest.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

@testable import CashRegister
import XCTest

class ProductTest: XCTestCase {
    var product: Product!

    override func setUp() {
        product = Product(name: "vine", quantity: 4, price: 5000)
    }

    override func tearDown() {
        product = nil
    }

    func testInitProductWithParamentParameters() {
        XCTAssertNotNil(product, "Product should not be nil")
    }

    func testWhenGivenParametersItSetted() {
        XCTAssertEqual(product.name, "vine", "Names should be the same")
        XCTAssertEqual(product.quantity, 4, "Quantity should be the same")
        XCTAssertEqual(product.price, 5000, "Price should be the same")
    }
}
