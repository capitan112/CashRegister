//
//  RecipeTest.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import XCTest

class RecipeTest: XCTestCase {

    var recipe: Recipe!
    
    override func setUp() {
        recipe = Recipe(products: [])
    }

    override func tearDown() {
        recipe = nil
    }

    func testRecipeInitWithProducts() {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 2, price: 200)
        let products = [vine, beer]
        recipe = Recipe(products:products)
        
        XCTAssertEqual(products[0].name, recipe.products[0].name, "Names should be the same")
    }
    
    func testReceipShoudGenerateSeparateLine() {
        let expectedLine = "-------------------------------------------------------"
        
        XCTAssertEqual(recipe.addSeparateLine(), expectedLine, "Line should be the same")
    }

    func testRecipeGeneateFormatedHeaders() {
    
        let header = recipe.generateHeader()
        
        let expectedHeader = "Label of item  Quantity       Unit price     Total price    \n-------------------------------------------------------"
        XCTAssertEqual(header, expectedHeader, "Header should be the same")
    }
    

}
