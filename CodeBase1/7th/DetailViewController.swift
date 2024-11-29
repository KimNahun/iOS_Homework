//
//  DetailViewController.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/26/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    let indexPathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(indexPathLabel)
        
        NSLayoutConstraint.activate([
            indexPathLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indexPathLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


