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
        addSubview(scrollView)
        scrollView.addSubviews(logoImageView, stackView, buttonLogIn)
        setupConstraints()
        registerForKeyboardNotifications()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    
    let logoImageView: UIImageView = {
        var logo = UIImageView(image: UIImage(named: "logo"))
        return logo
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.addArrangedSubviews(logInText, passwordText)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var logInText: UITextField = {
        let logIn = PaddedTextField()
        logIn.text = "Email or phone"
        logIn.backgroundColor = .systemGray6
        logIn.layer.borderColor = UIColor.lightGray.cgColor
        logIn.layer.borderWidth = 0.5
        logIn.layer.cornerRadius = 10
        logIn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        logIn.textColor = .black
        logIn.font = .systemFont(ofSize: 16, weight: .regular)
        logIn.tintColor = UIColor(named: "accentColor")
        logIn.autocapitalizationType = .none
        logIn.addTarget(self, action: #selector(tapReturn(sender:)), for: .editingDidEndOnExit)
        return logIn
    }()
    
    private lazy var passwordText: UITextField = {
        let password = PaddedTextField()
        password.text = "Password"
        password.backgroundColor = .systemGray6
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.textColor = .black
        password.font = .systemFont(ofSize: 16, weight: .regular)
        password.tintColor = UIColor(named: "accentColor")
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.addTarget(self, action: #selector(tapReturn(sender:)), for: .editingDidEndOnExit)
        return password
    }()
    
    @objc func tapReturn(sender: UIControl) {
        sender.resignFirstResponder()
    }
    
    lazy var buttonLogIn: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named:"blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    override func layoutSubviews() {
        scrollView.contentSize = frame.size
        super.layoutSubviews()
    }
    
    func setupConstraints(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -16),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            buttonLogIn.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            buttonLogIn.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardAppear(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardDisappear(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }

    @objc func onKeyboardAppear(_ notification: NSNotification) {
        let info = notification.userInfo!
        let rect: CGRect = info[UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
        
        scrollView.contentOffset = CGPoint(x: 0, y: rect.height)
    }

    @objc func onKeyboardDisappear(_ notification: NSNotification) {
        scrollView.contentOffset = .zero
    }
}
