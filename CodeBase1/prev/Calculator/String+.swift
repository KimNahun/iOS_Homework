//
//  String+.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import Foundation

extension String {
    func isOperator() -> Bool {
        return ["+", "-", "*", "/", "="].contains(self)
    }
}
