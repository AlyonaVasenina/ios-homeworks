//
//  UIKit + Extension Swift.swift
//  Navigation
//
//  Created by Alena Vasenina on 18.11.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

