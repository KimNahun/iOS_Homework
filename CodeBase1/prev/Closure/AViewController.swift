//
//  AViewController.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/12/24.
//

import UIKit

// AViewController - count 값을 증가시키고, BViewController를 호출하는 뷰 컨트롤러
class AViewController: UIViewController {
    
    var count: Int = 0 {
        didSet {
            countLabel.text = "Count: \(count)"
        }
    }
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "Count: 0"
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let openBButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open BViewController", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(countLabel)
        view.addSubview(openBButton)
        
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            openBButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openBButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20)
        ])
        
        openBButton.addTarget(self, action: #selector(openBViewController), for: .touchUpInside)
    }
    
    @objc private func openBViewController() {
        let bViewController = BViewController()
        
        // BViewController의 onButtonTap 클로저에 count 증가하는 핸들러 할당
        bViewController.onButtonTap = { [weak self] in
            self?.count += 1
        }
        
        // 클로저를 설정한 bViewController 인스턴스를 푸시
        navigationController?.pushViewController(bViewController, animated: true)
    }
}


// BViewController - 버튼 클릭 이벤트를 AViewController로 전달하는 뷰 컨트롤러
