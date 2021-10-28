//
//  InfoVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 29.10.2021.
//

import UIKit

class InfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(alertButton)
    }
    
    private lazy var alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 100, width: 200, height: 50))
        button.setTitle("Show alert", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapAlert() {
        print("test")
    }
}
