//
//  Tax.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 28/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

enum StateTax: Double {
    case UT = 0.0685
    case NV = 0.0800
    case TX = 0.0625
    case AL = 0.0400
    case CA = 0.0825
}

protocol TaxProtocol {
    init(stateTax: StateTax)
    func taxInPercentage() -> String
    func currentTax() -> Double
}

class Tax: TaxProtocol {
    private var stateTax: StateTax

    required init(stateTax: StateTax) {
        self.stateTax = stateTax
    }

    func taxInPercentage() -> String {
        return "Tax " + String(format: "%.2f", stateTax.rawValue * 100) + "%"
    }
    
    func currentTax() -> Double {
        return stateTax.rawValue
    }
}
