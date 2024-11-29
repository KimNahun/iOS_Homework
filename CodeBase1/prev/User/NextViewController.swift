//
//  SecondViewController.swift
//  CodeBase1
//
//  Created by 김나훈 on 11/12/24.
//

import UIKit

final class NextViewController: UIViewController {
    
    var completionHandler: (() -> Void)?
    
    let label: UILabel = {
       let label = UILabel()
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown

        // 클로저에서 self를 약한 참조로 변경하여 사이클 방지
        completionHandler = {
                    print("Completion handler called")
                    print(self) // self를 강하게 참조하여 사이클 발생
                }
    }
    deinit {
           print("MyViewController deinitialized")
       }
}
