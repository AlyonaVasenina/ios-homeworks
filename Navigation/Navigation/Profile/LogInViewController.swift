//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alena Vasenina on 30.11.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logInView = LogInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(logInView)
        
        logInView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            logInView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            logInView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
}
