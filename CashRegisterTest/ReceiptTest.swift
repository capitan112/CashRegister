//
//  ReceiptTest.swift
//  CashRegisterTest
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//
@testable import CashRegister
import XCTest

class ReceiptTest: XCTestCase {
    var receipt: Receipt!

    override func setUp() {
        receipt = Receipt(products: [])
    }

    override func tearDown() {
        receipt = nil
    }

    func testReceiptInitWithProducts() {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 2, price: 200)
        let products = [vine, beer]
        receipt = Receipt(products: products)

        XCTAssertEqual(products[0].name, receipt.products[0].name, "Names should be the same")
    }

    func testReceipShoudGenerateSeparateLine() {
        let expectedLine = "-------------------------------------------------------"

        XCTAssertEqual(receipt.addSeparateLine(), expectedLine, "Line should be the same")
    }

    func testReceiptGeneateFormatedHeaders() {
        let header = receipt.generateHeader()

        let expectedHeader = "Label of item  Quantity       Unit price     Total price    \n-------------------------------------------------------"
        XCTAssertEqual(header, expectedHeader, "Header should be the same")
    }

    func productsInReceipe() -> [Product] {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 1, price: 500)

        return [vine, beer]
    }

    func testProductInReceiptShouldGenereatingLineByLine() {
        receipt = Receipt(products: productsInReceipe())

        let productsInRows = receipt.productsEncounter()

        print(productsInRows)
        let firstRowsOfProducts = "vine           4.0            5000.0         20000.0"
        let secondRowsOfProducts = "beer           1.0            500.0          500.0"

        XCTAssertEqual(productsInRows[0], firstRowsOfProducts, "Rows of product in receipt should be the same")
        XCTAssertEqual(productsInRows[1], secondRowsOfProducts, "Rows of product in receipt should be the same")
    }

    func testProductInReceiptGenerateTotalCostOfProductsWithoutTax() {
        receipt = Receipt(products: productsInReceipe())

        XCTAssertEqual(receipt.totalWithoutTaxes(), 20500.00, "Rows of product in receipt should be the same")
    }

    func testProductInReceiptGenerateTotalCostOfProductsWithoutTaxLine() {
        receipt = Receipt(products: productsInReceipe())

        let expectedLine = "Total without taxes                          20500.00"

        XCTAssertEqual(receipt.totalWithoutTaxesOutput(), expectedLine, "Total cost line n receipt should be the same")
    }
    
}
