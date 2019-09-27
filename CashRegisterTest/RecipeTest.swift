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
        
        XCTAssertEqual(products[0].name, recipe.products[0].name, "Names should be the same")
    }
    
    func testRecipeGeneateFormatedHeaders() {
    
        let recipe = Recipe(products: [])
        let header = recipe.generateHeader()
        
        let expectedHeader = "Label of item  Quantity       Unit price     Total price    \n-------------------------------------------------------"
        XCTAssertEqual(header, expectedHeader, "Header should be the same")
    }
    
//    fileprivate func addSeparateLine() -> String {
//        return "-------------------------------------------------------"
//    }
//
//    fileprivate func generateHeader() -> String {
//        // headers formater
//
//        var result: String = ""
//        let headers = ["Label of item", "Quantity", "Unit price", "Total price"]
//        let formatedHeaders = headers.map { Formatter.formatString($0) }
//
//        for header in formatedHeaders {
//            result += header
//        }
//        result += "\n"
//        result += addSeparateLine()
//
//        return result
//    }

}
