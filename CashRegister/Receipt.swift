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
    
    init(products: [Product]) {
        self.products = products
        self.formatter = LineFormatter()
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
            let productName = formatter.addPaddingsAtEnd(to: product.name, padding: 15)
            let productQuantity = formatter.addPaddingsAtEnd(to: String(product.quantity), padding: 15)
            let productPrice = formatter.addPaddingsAtEnd(to: String(product.price), padding: 15)

            productsInReceipt.append(productName + productQuantity + productPrice + product.summaryCostInRow())
        }
        
        return productsInReceipt
    }
    
    func generateOutput() {
        print(generateHeader())
        
        for row in productsEncounter() {
            print(row)
        }
        
        print(addSeparateLine())
        
    }
    
    func totalWithoutTaxes() -> Double {
        var totalWithoutTaxes = 0.0
        
        for product in products {
            totalWithoutTaxes += product.summaryCost()
        }
        
        return totalWithoutTaxes
    }
    
    
}


