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

    fileprivate func formatPercentage(for number: Double) -> String {
        return formatter.formatPercentage(for: number)
    }

    // MARK: Calculating

    func totalWithoutTaxes() -> Double {
        var totalWithoutTaxes = 0.0

        for product in products {
            totalWithoutTaxes += product.summaryCost()
        }

        return totalWithoutTaxes
    }

    func discountAmount() -> Double {
        return discount.amountOfDiscount(from: totalWithoutTaxes())
    }

    func taxAmount() -> Double {
        let totalWithDiscount = totalWithoutTaxes() - discountAmount()

        return tax.taxAmount(of: totalWithDiscount)
    }

    // MARK: Generate part of receipt

    func headerOutput() -> String {
        var result: String = ""
        let headers = ["Label of item", "Quantity", "Unit price", "Total price"]

        for header in headers {
            result += addPaddings(to: header, padding: productPadding)
        }
        result += "\n"
        result += separateLineOutput()

        return result
    }

    func separateLineOutput() -> String {
        return "-------------------------------------------------------"
    }

    func productsListForming() -> [String] {
        var productsInReceipt = [String]()

        for product in products {
            let productName = addPaddings(to: product.name, padding: productPadding)
            let productQuantity = addPaddings(to: String(product.quantity), padding: productPadding)
            let productPrice = addPaddings(to: String(product.price), padding: productPadding)

            productsInReceipt.append(productName + productQuantity + productPrice + product.summaryCostInRow())
        }

        return productsInReceipt
    }

    func totalWithoutTaxesOutput() -> String {
        let totalWithoutTaxesLine = "Total without taxes"

        let formatedTotalWithoutTaxesLine = addPaddings(to: totalWithoutTaxesLine, padding: longPadding)

        return formatedTotalWithoutTaxesLine + formatPercentage(for: totalWithoutTaxes())
    }

    func discountOutput() -> String {
        let discountTitle = discount.discountTitleOutput(from: totalWithoutTaxes())
        let discountTitleWithPadding = addPaddings(to: discountTitle, padding: paddingWithSign)

        let formatedDiscountAmount = formatPercentage(for: discountAmount())

        return discountTitleWithPadding + "-" + formatedDiscountAmount
    }

    func taxOutput() -> String {
        return addPaddings(to: tax.taxInPercentage(), padding: paddingWithSign) + "+" + formatPercentage(for: taxAmount())
    }

    func totalPriceOutput() -> String {
        let totalPriceTitle = "Total price"

        let formatedTotalPriceTitle = addPaddings(to: totalPriceTitle, padding: longPadding)
        let totalPrice = totalWithoutTaxes() - discountAmount() + taxAmount()

        return formatedTotalPriceTitle + String(format: "%.2f", totalPrice)
    }

    func machineReceiptOutput() {
        print(headerOutput())

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
