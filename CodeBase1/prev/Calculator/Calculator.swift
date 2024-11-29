//
//  Calculator.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/5/24.
//
import Foundation

class CalculatorModel {
    private var firstOperand: Double?
    private var secondOperand: Double?
    private var currentOperator: CalculatorOperator?

    func setNumber(_ number: CalculatorNumber) -> String {
        // 현재 입력된 숫자를 Double 값으로 변환
        let value = Double(number.rawValue)

        // 현재 연산자가 없는 경우 첫 번째 피연산자 설정
        if currentOperator == nil {
     //       firstOperand = (firstOperand ?? 0) * 10 + (value ??)
            return formatNumber(firstOperand)
        }
        // 연산자가 있는 경우 두 번째 피연산자 설정
        else {
    //        secondOperand = (secondOperand ?? 0) * 10 + value
            return formatNumber(secondOperand)
        }
    }

    func setOperator(_ operator: CalculatorOperator) {
        currentOperator = `operator`
    }

    func calculate() -> String {
        // 옵셔널 값 안전하게 언래핑
        guard let firstOperand = firstOperand,
              let secondOperand = secondOperand,
              let `operator` = currentOperator else {
            return "Error" // 연산을 수행할 수 없는 경우
        }

        // 결과값 계산
        let result: Double
        switch `operator` {
        case .add:
            result = firstOperand + secondOperand
        case .subtract:
            result = firstOperand - secondOperand
        case .multiply:
            result = firstOperand * secondOperand
        case .divide:
            result = secondOperand != 0 ? firstOperand / secondOperand : Double.nan
        case .equal:
            break
        case .clear:
            break
        }

        // 상태 초기화 및 결과 반환
        reset()
     //   self.firstOperand = result
        return ""
    }

    func reset() {
        firstOperand = nil
        secondOperand = nil
        currentOperator = nil
    }

    private func formatNumber(_ value: Double?) -> String {
        // 옵셔널 값 안전하게 처리하여 문자열 포맷팅
        guard let value = value else { return "0" }
        return value.truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(value))" : "\(value)"
    }
}
