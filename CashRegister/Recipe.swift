//
//  Recipe.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

class Receipt {
    var products: [Product]
    var formatter: LineFormatter!

    init(products: [Product]) {
        self.products = products
        formatter = LineFormatter()
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
        var productsInRecipe = [String]()

        for product in products {
            let productName = formatter.addPaddingsAtEnd(to: product.name, padding: 15)
            let productQuantity = formatter.addPaddingsAtEnd(to: String(product.quantity), padding: 15)
            let productPrice = formatter.addPaddingsAtEnd(to: String(product.price), padding: 15)

            productsInRecipe.append(productName + productQuantity + productPrice + product.summaryCostInRow())
        }

        return productsInRecipe
    }

    func generateOutput() {
        print(generateHeader())

        for row in productsEncounter() {
            print(row)
        }

        print(addSeparateLine())
    }
}
