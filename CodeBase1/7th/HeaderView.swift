//
//  HeaderView.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    private let titleLabel = UILabel()
    private let addButton = UIButton(type: .system)
    var addButtonAction: ((Int) -> Void)?
    private var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        contentView.addSubview(addButton)
        addButton.setTitle("+", for: .normal)
        
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        addButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    @objc func didTapButton() {
        addButtonAction?(0)
    }
    
}
