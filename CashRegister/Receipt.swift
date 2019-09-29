//
//  Receipt.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

class Receipt {
    var products: [Product]
    var formatter: LineFormatterProtocol!
    var discount: DiscountProtocol!
    var tax: TaxProtocol!
    let paddingWithSign = 44
    let longPadding = 45
    let productPadding = 15

    init(products: [Product], formatter: LineFormatterProtocol, discount: DiscountProtocol, tax: TaxProtocol) {
        self.products = products
        self.formatter = formatter
        self.discount = discount
        self.tax = tax
    }

    // MARK: Formatting

    fileprivate func addPaddings(to text: String, padding: Int) -> String {
        return formatter.addPaddingsAtEnd(to: text, padding: padding)
    }

    fileprivate func formatTwoDigits(for number: Double) -> String {
        return formatter.formatTwoDigits(for: number)
    }

    // MARK: Calculating

    func totalWithoutTaxes() -> Double {
        return products.reduce(0) { $0 + $1.summaryCost() }
    }

    func discountAmount() -> Double {
        return discount.amountOfDiscount(from: totalWithoutTaxes())
    }

    func taxAmount() -> Double {
        return tax.taxAmount(of: totalWithoutTaxes() - discountAmount())
    }

    func taxPercentage() -> String {
        return tax.taxPercentage()
    }

    // MARK: Generate part of receipt

    func headerOutput() -> String {
        var result: String = ""
        let headers = ["Label of item", "Quantity", "Unit price", "Total price"]

        for header in headers {
            result += addPaddings(to: header, padding: productPadding)
        }

        return result
    }

    func separateLineOutput() -> String {
        return "-------------------------------------------------------"
    }

    func productsListForming() -> [String] {
        var productsInReceipt = [String]()

        for product in products {
            let productName = addPaddings(to: product.name, padding: productPadding)
            let productQuantity = formatTwoDigits(for: product.quantity)
            let productQuantityFormated = addPaddings(to: String(productQuantity), padding: productPadding)
            let productPrice = addPaddings(to: String(product.price), padding: productPadding)

            productsInReceipt.append(productName + productQuantityFormated + productPrice + product.summaryCostInRow())
        }

        return productsInReceipt
    }

    func totalWithoutTaxesOutput() -> String {
        let totalWithoutTaxesLine = "Total without taxes"
        let formatedTotalWithoutTaxesLine = addPaddings(to: totalWithoutTaxesLine, padding: longPadding)

        return formatedTotalWithoutTaxesLine + formatTwoDigits(for: totalWithoutTaxes())
    }

    func discountOutput() -> String {
        let discountTitle = discount.discountTitleOutput(from: totalWithoutTaxes())
        let discountTitleWithPadding = addPaddings(to: discountTitle, padding: paddingWithSign)
        let formatedDiscountAmount = formatTwoDigits(for: discountAmount())

        return discountTitleWithPadding + "-" + formatedDiscountAmount
    }

    func taxOutput() -> String {
        return addPaddings(to: taxPercentage(), padding: paddingWithSign) + "+" + formatTwoDigits(for: taxAmount())
    }

    func totalPriceOutput() -> String {
        let totalPriceTitle = "Total price"
        let formatedTotalPriceTitle = addPaddings(to: totalPriceTitle, padding: longPadding)
        let totalPrice = totalWithoutTaxes() - discountAmount() + taxAmount()

        return formatedTotalPriceTitle + formatTwoDigits(for: totalPrice)
    }

    func machineReceiptOutput() {
        print(headerOutput())
        print(separateLineOutput())

        for row in productsListForming() {
            print(row)
        }

        print(separateLineOutput())
        print(totalWithoutTaxesOutput())
        print(discountOutput())
        print(taxOutput())
        print(separateLineOutput())
        print(totalPriceOutput())
    }
}
