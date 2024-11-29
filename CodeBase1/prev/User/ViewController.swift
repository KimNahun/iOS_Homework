////
////  Sample.swift
////  CodeBase1
////
////  Created by 김나훈 on 11/5/24.
////
////
//import UIKit
//
//class ViewController: UIViewController {
//    
//    private var user = User(name: "")
//    
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Your name"
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 24)
//        return label
//    }()
//    
//    private let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "이름을 입력하세요"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    private let showNameButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("show Name", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    // MARK: - Lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupLayout()
//        view.backgroundColor = .white
//        showNameButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//    }
//    
//    private func setupLayout() {
//        view.addSubview(nameLabel)
//        view.addSubview(nameTextField)
//        view.addSubview(showNameButton)
//        
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
//            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            
//            showNameButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            showNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            showNameButton.widthAnchor.constraint(equalToConstant: 40),
////            showNameButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
//        
//    }
//    @objc private func buttonTapped() {
//        
//        let text: String = nameTextField.text!
//        
//        nameLabel.text = text
//        navigationController?.pushViewController(NextViewController(), animated: true)
//    }
//}
