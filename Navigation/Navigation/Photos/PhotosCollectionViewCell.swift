//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alena Vasenina on 10.01.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
