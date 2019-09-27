//
//  Recipe.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

class Recipe {
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
    
    
}


