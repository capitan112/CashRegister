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
//    var product: Product!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitProductWithParamentParameters() {
        let product = Product(name: "vine", quantity: 4, price: 5000)
        XCTAssertNotNil(product)
    }
    
    func testWhenGivenParametersItSetted() {
        let product = Product(name: "vine", quantity: 4, price: 5000)
        
        XCTAssertEqual(product.name, "vine")
        XCTAssertEqual(product.quantity, 4)
        XCTAssertEqual(product.price, 5000)
    }

}
