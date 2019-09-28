//
//  LineFormatter.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

class LineFormatter {
    func addPaddingsAtEnd(to string: String, padding: Int) -> String {
        let formatedString = string.padding(toLength: padding, withPad: " ", startingAt: 0)

        return formatedString
    }

    func formatPercentage(for amout: Double) -> String {
        return String(format: "%.2f", amout)
    }
}
