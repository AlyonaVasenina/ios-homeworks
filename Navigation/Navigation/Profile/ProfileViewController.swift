//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alena Vasenina on 04.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Profile"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileHV = ProfileHeaderView()
    
    var botomButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubviews(profileHV, botomButton)
    
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHV.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHV.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHV.heightAnchor.constraint(equalToConstant: 220),
        ])
        
        botomButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            botomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            botomButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            botomButton.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
    }
    
}
