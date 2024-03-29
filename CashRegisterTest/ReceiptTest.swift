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
        let tax = Tax(stateTax: .NV)
        let receipt = Receipt(products: [], formatter: formatter, discount: discount, tax: tax)

        return receipt
    }

    func generateReceiptWithProducts(products: [Product]) -> Receipt {
        let formatter = LineFormatter()
        let discount = Discount()
        let tax = Tax(stateTax: .NV)

        return Receipt(products: products, formatter: formatter, discount: discount, tax: tax)
    }

    func productsWith2500Amount() -> [Product] {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 1, price: 500)

        return [vine, beer]
    }

    func productsWith2800Amount() -> [Product] {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 1, price: 800)

        return [vine, beer]
    }

    func testReceiptInitWithProducts() {
        let vine = Product(name: "vine", quantity: 4, price: 5000)
        let beer = Product(name: "beer", quantity: 2, price: 200)
        let products = [vine, beer]
        let formatter = LineFormatter()
        let discount = Discount()
        let tax = Tax(stateTax: .NV)

        receipt = Receipt(products: products, formatter: formatter, discount: discount, tax: tax)

        XCTAssertEqual(products[0].name, receipt.products[0].name, "Names should be the same")
    }

    func testReceipShoudGenerateSeparateLine() {
        let expectedLine = "-------------------------------------------------------"

        XCTAssertEqual(receipt.separateLineOutput(), expectedLine, "Line should be the same")
    }

    func testReceiptGeneateFormatedHeaders() {
        let header = receipt.headerOutput()

        let expectedHeader = "Label of item  Quantity       Unit price     Total price    "
        XCTAssertEqual(header, expectedHeader, "Header should be the same")
    }

    func testProductInReceiptShouldGenereatingLineByLine() {
        receipt = generateReceiptWithProducts(products: productsWith2500Amount())

        let productsInRows = receipt.productsListForming()

        let firstRowsOfProducts = "vine           4.00           5000.0         20000.0"
        let secondRowsOfProducts = "beer           1.00           500.0          500.0"

        XCTAssertEqual(productsInRows[0], firstRowsOfProducts, "Rows of product in receipt should be the same")
        XCTAssertEqual(productsInRows[1], secondRowsOfProducts, "Rows of product in receipt should be the same")
    }

    func testProductInReceiptGenerateTotalCostOfProductsWithoutTax() {
        receipt = generateReceiptWithProducts(products: productsWith2500Amount())

        XCTAssertEqual(receipt.totalWithoutTaxes(), 20500.00, "Rows of product in receipt should be the same")
    }

    func testProductInReceiptGenerateTotalCostOfProductsWithoutTaxLine() {
        receipt = generateReceiptWithProducts(products: productsWith2500Amount())

        let expectedLine = "Total without taxes                          20500.00"

        XCTAssertEqual(receipt.totalWithoutTaxesOutput(), expectedLine, "Total cost line in receipt should be the same")
    }

    func testProductInReceiptGenerateDiscountLineTenPersentage() {
        receipt = generateReceiptWithProducts(products: productsWith2500Amount())
        let expectedLine = "Discount 10.00%                             -2050.00"

        XCTAssertEqual(receipt.discountOutput(), expectedLine, "Discount in receipt should be the same")
    }

    func testTaxRowInReceiptGenerateTaxLineWithEightPersentage() {
        receipt = generateReceiptWithProducts(products: productsWith2500Amount())
        let expectedLine = "Tax 8.00%                                   +1476.00"

        XCTAssertEqual(receipt.taxOutput(), expectedLine, "Tax in receipt should be the same")
    }

    func testTotalPriceInReceiptGenerateTotalPriceLine() {
        receipt = generateReceiptWithProducts(products: productsWith2500Amount())
        let expectedLine = "Total price                                  19926.00"

        XCTAssertEqual(receipt.totalPriceOutput(), expectedLine, "Total price in receipt should be the same")
    }

    func testTotalPriceInReceiptGenerateTotalPriceLineForDifferentAmount() {
        receipt = generateReceiptWithProducts(products: productsWith2800Amount())
        let expectedLine = "Total price                                  20217.60"

        XCTAssertEqual(receipt.totalPriceOutput(), expectedLine, "Total price in receipt should be the same")
    }

    func testTotalPriceInReceiptGenerateTotalPriceLineForZeroAmount() {
        receipt = generateReceiptWithProducts(products: [])
        let expectedLine = "Total price                                  0.00"

        XCTAssertEqual(receipt.totalPriceOutput(), expectedLine, "Total price in receipt should be the same")
    }
}
