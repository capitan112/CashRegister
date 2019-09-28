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
        receipt = generateEmptyReceipt()
    }

    override func tearDown() {
        receipt = nil
    }

    func generateEmptyReceipt() -> Receipt {
        let formatter = LineFormatter()
        let discount = Discount()
        let tax = Tax()
        let receipt = Receipt(products: [], formatter: formatter, discount: discount, tax: tax)
        
        return receipt
    }
    
    func generateReceiptWithProducts() -> Receipt {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 1, price: 500)
        let products = [vine, beer]
        let formatter = LineFormatter()
        let discount = Discount()
        let tax = Tax()
     
        return Receipt(products: products, formatter: formatter, discount: discount, tax: tax)
    }
    
    func testReceiptInitWithProducts() {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 2, price: 200)
        let products = [vine, beer]
        let formatter = LineFormatter()
        let discount = Discount()
        let tax = Tax()
        
        receipt = Receipt(products: products, formatter: formatter, discount: discount, tax: tax)

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
        receipt = generateReceiptWithProducts()

        let productsInRows = receipt.productsEncounter()

        let firstRowsOfProducts = "vine           4.0            5000.0         20000.0"
        let secondRowsOfProducts = "beer           1.0            500.0          500.0"

        XCTAssertEqual(productsInRows[0], firstRowsOfProducts, "Rows of product in receipt should be the same")
        XCTAssertEqual(productsInRows[1], secondRowsOfProducts, "Rows of product in receipt should be the same")
    }

    func testProductInReceiptGenerateTotalCostOfProductsWithoutTax() {
        receipt = generateReceiptWithProducts()

        XCTAssertEqual(receipt.totalWithoutTaxes(), 20500.00, "Rows of product in receipt should be the same")
    }

    func testProductInReceiptGenerateTotalCostOfProductsWithoutTaxLine() {
        receipt = generateReceiptWithProducts()

        let expectedLine = "Total without taxes                          20500.00"

        XCTAssertEqual(receipt.totalWithoutTaxesOutput(), expectedLine, "Total cost line in receipt should be the same")
    }

    func testProductInReceiptGenerateDiscountLine() {
        receipt = generateReceiptWithProducts()
        let expectedLine = "Discount 10.00%                             -2050.00"

        XCTAssertEqual(receipt.discountOutput(), expectedLine, "Discount in receipt should be the same")
    }
    
    func testTaxRowInReceiptGenerateTaxLine() {
        receipt = generateReceiptWithProducts()
        let expectedLine = "Tax 4.00%                                   +738.00"

        XCTAssertEqual(receipt.taxOutput(), expectedLine, "Tax in receipt should be the same")
    }
}
