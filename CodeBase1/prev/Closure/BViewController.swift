//
//  BViewController.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/12/24.
//

import UIKit

class BViewController: UIViewController {
    
    // AViewController에서 count 증가를 위한 클로저
    var onButtonTap: (() -> Void)?
    
    private let incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Increment Count", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        view.addSubview(incrementButton)
        
        NSLayoutConstraint.activate([
            incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            incrementButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        incrementButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        // 버튼이 눌렸을 때 클로저 호출 (AViewController의 count를 증가시킴)
        onButtonTap?()
    }
}
