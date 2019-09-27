//
//  ProductTest.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import XCTest
@testable import CashRegister

class ProductTest: XCTestCase {
    var product: Product!
    
    override func setUp() {
        product = Product(name: "vine", quantity: 4, price: 5000)
    }

    override func tearDown() {
        product = nil
    }

    func testInitProductWithParamentParameters() {
        XCTAssertNotNil(product)
    }
    
    func testWhenGivenParametersItSetted() {        
        XCTAssertEqual(product.name, "vine")
        XCTAssertEqual(product.quantity, 4)
        XCTAssertEqual(product.price, 5000)
    }

}
