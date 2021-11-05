//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alena Vasenina on 04.11.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(statusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatarView: UIImageView = {
        var avatar = UIImageView(image: UIImage(named: "cat"))
        avatar.contentMode = .scaleAspectFill
        avatar.layer.cornerRadius = 70/2
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        return avatar
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let statusLabel: UILabel = {
        var label = UILabel()
        label.text = "Waiting for something..."
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed(){
        print(statusLabel.text!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.frame = CGRect(x: 16, y: 16, width: 80, height: 80)
        nameLabel.frame = CGRect(x: 112, y: 27, width: bounds.width - 16*3 - 80, height: 22)
        statusLabel.frame = CGRect(x: 112, y: 58, width: bounds.width - 16*3 - 80, height: 18)
        statusButton.frame = CGRect(x: 16, y: avatarView.frame.maxY + 16, width: bounds.width - 16*2, height: 50)
    }
}
