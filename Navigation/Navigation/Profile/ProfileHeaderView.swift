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
        addSubview(statusTextField)
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
    
    lazy var statusTextField: UITextField = {
        var textField = UITextField()
        textField.text = "Waiting for something..."
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return textField
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private var statusText = String()
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text!
    }
    
    @objc func buttonPressed(){
        statusLabel.text = statusText
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarView.frame = CGRect(x: 16, y: 16, width: 86, height: 86)
        nameLabel.frame = CGRect(x: 118, y: 27, width: bounds.width - 16*3 - 86, height: 22)
        statusLabel.frame = CGRect(x: 118, y: 53, width: bounds.width - 16*3 - 86, height: 16)
        statusTextField.frame = CGRect(x: 118, y: 73, width: bounds.width - 16*3 - 86, height: 40)
        statusButton.frame = CGRect(x: 16, y: avatarView.frame.maxY + 16, width: bounds.width - 16*2, height: 50)
    }
}
