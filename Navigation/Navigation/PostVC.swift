//
//  PostVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

class PostVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Post"
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
