//
//  LineFormatter.swift
//  CashRegister
//
//  Created by Oleksiy Chebotarov on 27/09/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//

import Foundation

protocol LineFormatterProtocol {
    func addPaddingsAtEnd(to string: String, padding: Int) -> String
    func formatTwoDigits(for amout: Double) -> String
}

class LineFormatter: LineFormatterProtocol {
    func addPaddingsAtEnd(to string: String, padding: Int) -> String {
        let formatedString = string.padding(toLength: padding, withPad: " ", startingAt: 0)

        return formatedString
    }

    func formatTwoDigits(for amout: Double) -> String {
        return String(format: "%.2f", amout)
    }
}
