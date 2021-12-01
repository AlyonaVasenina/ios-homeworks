//
//  LogInView.swift
//  Navigation
//
//  Created by Alena Vasenina on 02.12.2021.
//

import UIKit

class LogInView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(logoImageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoImageView: UIImageView = {
        var logo = UIImageView(image: UIImage(named: "logo"))
        return logo
    }()
    
    func setupConstraints(){
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
