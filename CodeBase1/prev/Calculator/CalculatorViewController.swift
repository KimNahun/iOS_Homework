//
//  CalculatorViewController.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import UIKit

final class CalculatorViewController: UIViewController {
    private let calculatorModel = CalculatorModel()
    private let calculatorView = CalculatorView()

    override func loadView() {
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }

    private func setupActions() {
        // 숫자 버튼 동작 설정
        CalculatorNumber.allCases.forEach { number in
            calculatorView.buttonActions[number] = { [weak self] in
                guard let self = self else { return }
                let updatedText = self.calculatorModel.setNumber(number)
                self.calculatorView.displayLabel.text = updatedText
            }
        }

        // 연산자 버튼 동작 설정
        calculatorView.buttonActions[CalculatorOperator.add] = { [weak self] in
            self?.calculatorModel.setOperator(.add)
        }
        calculatorView.buttonActions[CalculatorOperator.subtract] = { [weak self] in
            self?.calculatorModel.setOperator(.subtract)
        }
        calculatorView.buttonActions[CalculatorOperator.multiply] = { [weak self] in
            self?.calculatorModel.setOperator(.multiply)
        }
        calculatorView.buttonActions[CalculatorOperator.divide] = { [weak self] in
            self?.calculatorModel.setOperator(.divide)
        }

        // "=" 버튼 동작 설정
        calculatorView.buttonActions[CalculatorOperator.equal] = { [weak self] in
            guard let self = self else { return }
            let result = self.calculatorModel.calculate()
            self.calculatorView.displayLabel.text = result
        }

        // "C" 버튼 동작 설정 (초기화)
        calculatorView.buttonActions[CalculatorOperator.clear] = { [weak self] in
            guard let self = self else { return }
            self.calculatorModel.reset()
            self.calculatorView.displayLabel.text = "0"
        }
    }
}
