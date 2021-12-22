//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alena Vasenina on 23.12.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
