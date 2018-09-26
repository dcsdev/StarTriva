//
//  BlackBG.swift
//  StarWarsAPI
//
//  Created by Douglas Spencer on 9/12/18.
//  Copyright © 2018 Douglas Spencer. All rights reserved.
//

import UIKit

class BlackBGView: UIView {
    override func awakeFromNib() {
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.cornerRadius = 10.0
    }
}

class BlackBGButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.cornerRadius = 10.0
    }
}

class BlackBGCollectionView: UICollectionView {
    override func awakeFromNib() {
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        //layer.cornerRadius = 10.0
    }
}
    
    class BlackBGTextView: UITextView {
        override func awakeFromNib() {
            layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
            //layer.cornerRadius = 10.0
        }
}
