//
//  Product.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

struct Product {
    var name: String
    var quantity: Double
    var price: Double
    
    func summaryCostInRow() -> String {
        return String(summaryCost())
    }
    
    func summaryCost() -> Double {
        return quantity * price
    }
}
