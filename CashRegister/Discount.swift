//
//  Discount.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 28/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

class Discount {
    typealias DiscountSummary = (discount: Double, totalDiscount: Double)

    private enum Discounts: Double {
        case noDiscount = 0.00
        case three = 0.03
        case five = 0.05
        case seven = 0.07
        case ten = 0.1
        case fifteen = 0.15
    }
    
    func calculatingFrom(totalCost: Double) -> DiscountSummary {
        var discountRate: Double = Discounts.noDiscount.rawValue

        switch totalCost {
        case 0 ... 1000:
            break
        case 1001 ... 5000:
            discountRate = Discounts.three.rawValue
        case 5001 ... 7000:
            discountRate = Discounts.five.rawValue
        case 7001 ... 10000:
            discountRate = Discounts.seven.rawValue
        case 10001 ... 50000:
            discountRate = Discounts.ten.rawValue
        case 50001...:
            discountRate = Discounts.fifteen.rawValue
        default:
            break
        }
        
        return 0
    }
}


