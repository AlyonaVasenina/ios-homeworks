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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHV)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHV.frame = view.frame
        view.backgroundColor = .orange
    }
}
