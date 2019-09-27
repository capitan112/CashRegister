//
//  RecipeTest.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import XCTest

class RecipeTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecipeInitWithProducts() {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 2, price: 200)
        let products = [vine, beer]
        let recipe = Recipe(products:products)
        
        XCTAssertEqual(products[0].name, recipe.products[0].name)
    }


}
