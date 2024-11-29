//
//  CalculatorView.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import UIKit

final class CalculatorView: UIView {
    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 48, weight: .light)
        label.backgroundColor = .black
        label.textColor = .white
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let buttonTitles: [[String]] = [
        ["C", "/", "*", "-"],
        ["7", "8", "9", "+"],
        ["4", "5", "6", "="],
        ["1", "2", "3"],
        ["0"]
    ]

    var buttonActions: [AnyHashable: (() -> Void)] = [:]

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = .black
        addSubview(displayLabel)
        addSubview(stackView)

        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            displayLabel.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])

        for row in buttonTitles {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.spacing = 10
            rowStack.distribution = .fillEqually

            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                button.backgroundColor = title.isOperator() ? .orange : .darkGray
                button.setTitleColor(.white, for: .normal)
                button.layer.cornerRadius = 5
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
                rowStack.addArrangedSubview(button)
            }

            stackView.addArrangedSubview(rowStack)
        }
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }

        // 숫자 또는 연산자 Enum으로 변환 후 액션 호출
        if let number = CalculatorNumber(rawValue: title) {
            buttonActions[number]?()
        } else if let operation = CalculatorOperator(rawValue: title) {
            buttonActions[operation]?()
        }
    }
}
