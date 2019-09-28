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

class Tax {
    var currentTax: StateTax

    init(currentTax: StateTax) {
        self.currentTax = currentTax
    }

    func taxInPercentage() -> String {
        return "Tax " + String(format: "%.2f", currentTax.rawValue * 100) + "%"
    }
}
