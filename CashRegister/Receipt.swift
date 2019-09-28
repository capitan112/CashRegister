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
    let discountPadding = 44
    let totalWithoutTaxesPadding = 45
    let productPadding = 15

    init(products: [Product]) {
        self.products = products
        formatter = LineFormatter()
        discount = Discount()
    }

    func generateHeader() -> String {
        var result: String = ""
        let headers = ["Label of item", "Quantity", "Unit price", "Total price"]

        for header in headers {
            result += formatter.addPaddingsAtEnd(to: header, padding: 15)
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
            let productName = formatter.addPaddingsAtEnd(to: product.name, padding: productPadding)
            let productQuantity = formatter.addPaddingsAtEnd(to: String(product.quantity), padding: productPadding)
            let productPrice = formatter.addPaddingsAtEnd(to: String(product.price), padding: productPadding)

            productsInReceipt.append(productName + productQuantity + productPrice + product.summaryCostInRow())
        }

        return productsInReceipt
    }

    func receiptOutput() {
        print(generateHeader())

        for row in productsEncounter() {
            print(row)
        }

        print(addSeparateLine())
        print(totalWithoutTaxesOutput())
        print(discountOutput())
    }

    func totalWithoutTaxes() -> Double {
        var totalWithoutTaxes = 0.0

        for product in products {
            totalWithoutTaxes += product.summaryCost()
        }

        return totalWithoutTaxes
    }

    func totalWithoutTaxesOutput() -> String {
        let totalWithoutTaxesLine = "Total without taxes"

        let formatedTotalWithoutTaxesLine = formatter.addPaddingsAtEnd(to: totalWithoutTaxesLine, padding: totalWithoutTaxesPadding)

        return formatedTotalWithoutTaxesLine + String(format: "%.2f", totalWithoutTaxes())
    }

    func discountOutput() -> String {
        let discountTitle = discount.outputDiscountTitle(from: totalWithoutTaxes())
        let discountTitleWithPadding = formatter.addPaddingsAtEnd(to: discountTitle, padding: discountPadding)

        let formatedDiscountAmount = String(format: "%.2f", discount.amountOfDiscount(from: totalWithoutTaxes()))

        return discountTitleWithPadding + "-" + formatedDiscountAmount
    }
}
