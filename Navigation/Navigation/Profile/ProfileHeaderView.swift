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
    
    let statusLabel: UITextField = {
        var label = UITextField()
        label.backgroundColor = .blue
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.frame = CGRect(x: 16, y: 16, width: 70, height: 70)
        nameLabel.frame = CGRect(x: 102, y: 27, width: bounds.width - 16*3 - 70, height: 22)
        statusLabel.frame = CGRect(x: 102, y: 53, width: bounds.width - 16*3 - 70, height: 18)
    }
}
