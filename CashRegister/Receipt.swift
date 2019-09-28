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
    var formatter: LineFormatter!
    var discount: Discount!
    var tax: Tax!
    let paddingWithSign = 44
    let longPadding = 45
    let productPadding = 15

    init(products: [Product], formatter: LineFormatter, discount: Discount, tax: Tax) {
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

    func amountOfDiscount() -> Double {
        return discount.amountOfDiscount(from: totalWithoutTaxes())
    }

    func taxAmount() -> Double {
        let totalWithDiscount = totalWithoutTaxes() - amountOfDiscount()

        return tax.currentTax.rawValue * totalWithDiscount
    }

    // MARK: Generate part of receipt

    func headerOutput() -> String {
        var result: String = ""
        let headers = ["Label of item", "Quantity", "Unit price", "Total price"]

        for header in headers {
            result += addPaddings(to: header, padding: productPadding)
        }
        result += "\n"
        result += addSeparateLine()

        return result
    }

    func addSeparateLine() -> String {
        return "-------------------------------------------------------"
    }

    func productsEncounter() -> [String] {
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
        let discountTitle = discount.outputDiscountTitle(from: totalWithoutTaxes())
        let discountTitleWithPadding = addPaddings(to: discountTitle, padding: paddingWithSign)

        let formatedDiscountAmount = formatPercentage(for: amountOfDiscount())

        return discountTitleWithPadding + "-" + formatedDiscountAmount
    }

    func taxOutput() -> String {
        return addPaddings(to: tax.taxInPercentage(), padding: paddingWithSign) + "+" + formatPercentage(for: taxAmount())
    }

    func totalPriceOutput() -> String {
        let totalPriceTitle = "Total price"

        let formatedTotalPriceTitle = addPaddings(to: totalPriceTitle, padding: longPadding)
        let totalPrice = totalWithoutTaxes() - amountOfDiscount() + taxAmount()

        return formatedTotalPriceTitle + String(format: "%.2f", totalPrice)
    }

    func receiptOutput() {
        print(headerOutput())

        for row in productsEncounter() {
            print(row)
        }

        print(addSeparateLine())
        print(totalWithoutTaxesOutput())
        print(discountOutput())
        print(taxOutput())
        print(addSeparateLine())
        print(totalPriceOutput())
    }
}
