//
//  CalculatorNumber.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import Foundation

enum CalculatorNumber: String, CaseIterable {
    case zero = "0", one = "1", two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8", nine = "9"

    var value: Int {
        return Int(rawValue) ?? 0
    }
}
