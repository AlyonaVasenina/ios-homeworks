//
//  FeedVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

class FeedVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postButton)
    }
    
    private lazy var postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 100, width: 200, height: 50))
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapPost), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapPost() {
        let postVC = PostVC(post: Post(title: "Post test"))
        navigationController!.pushViewController(postVC, animated: true)
    }
        
}

